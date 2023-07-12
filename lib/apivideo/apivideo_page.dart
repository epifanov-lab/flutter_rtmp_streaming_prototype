import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rtmp_streaming_prototype/apivideo/types/params.dart';
import 'package:flutter_rtmp_streaming_prototype/utils.dart';

class ApiVideoPage extends StatefulWidget {
  const ApiVideoPage({Key? key}) : super(key: key);

  @override
  State<ApiVideoPage> createState() => _ApiVideoPageState();
}

class _ApiVideoPageState extends State<ApiVideoPage> with WidgetsBindingObserver {
  final config = Params();
  late final ApiVideoLiveStreamController _controller;
  bool _isStreaming = false;

  void _setIsStreaming(bool isStreaming) {
    if (!mounted) {
      return;
    }
    setState(() => _isStreaming = isStreaming);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _controller = _createLiveStreamController();
    _controller.initialize().catchError((e) {
      showSnackBar(context, e.toString());
    });
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      _controller.stop();
    } else if (state == AppLifecycleState.resumed) {
      _controller.startPreview();
    }
  }

  ApiVideoLiveStreamController _createLiveStreamController() {
    return ApiVideoLiveStreamController(
      initialAudioConfig: config.audio,
      initialVideoConfig: config.video,
      onConnectionSuccess: () {
        print('Connection succeeded');
        showSnackBar(context, 'Connection succeeded');
      },
      onConnectionFailed: (error) {
        print('Connection failed: $error');
        showCustomDialog(context, 'Connection failed', error);
        _setIsStreaming(false);
      },
      onDisconnection: () {
        print('Disconnected');
        showSnackBar(context, 'Disconnected');
        _setIsStreaming(false);
      },
    );
  }

  Future<void> onStartStreamingButtonPressed() async {
    try {
      await _controller.startStreaming(
        streamKey: config.streamKey,
        url: config.rtmpUrl,
      );
      _setIsStreaming(true);
    } catch (e) {
      if (e is PlatformException) {
        showCustomDialog(
          context,
          "Error",
          "Failed to start stream: ${e.message}",
        );
      } else {
        showCustomDialog(
          context,
          "Error",
          "Failed to start stream: $e",
        );
      }
    }
  }

  Future<void> onStopStreamingButtonPressed() async {
    try {
      await _controller.stopStreaming();
      _setIsStreaming(false);
    } catch (e) {
      if (e is PlatformException) {
        showCustomDialog(
          context,
          "Error",
          "Failed to stop stream: ${e.message}",
        );
      } else {
        showCustomDialog(
          context,
          "Error",
          "Failed to stop stream: $e",
        );
      }
    }
  }

  Future<void> _onTapSettings(BuildContext context) async {
    /*await //TODO: bottom sheet with stream url and key */
    _controller.setVideoConfig(config.video);
    _controller.setAudioConfig(config.audio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: ApiVideoCameraPreview(controller: _controller),
          ),
          //TODO: camera switch button
          //TODO: microphone on/off button
          //TODO: go live/end stream button
        ],
      ),
    );
  }
}