import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rtmp_streaming_prototype/apivideo/types/config.dart';
import 'package:flutter_rtmp_streaming_prototype/widgets/close_button.dart';
import 'package:flutter_rtmp_streaming_prototype/widgets/done_button.dart';

class SettingsDialog extends StatefulWidget {
  final Config config;

  const SettingsDialog({super.key, required this.config});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  bool _isChanged = false;

  void _onTapCloseOrDone() {
    Navigator.of(context).pop(_isChanged ? widget.config : null);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('RTMP'),
              const Spacer(),
              _isChanged
                  ? DoneButtonWidget(onTap: _onTapCloseOrDone)
                  : CloseButtonWidget(onTap: _onTapCloseOrDone)
            ],
          ),
          const SizedBox(height: 24),
          const Text('Stream URL'),
          _TextInputFieldWidget(
            hintText: 'rtmp://',
            initialValue: widget.config.rtmpUrl,
            onChanged: (String value) {
              setState(() {
                _isChanged = true;
                widget.config.rtmpUrl = value;
              });
            },
          ),
          const SizedBox(height: 24),
          const Text('Stream KEY'),
          _TextInputFieldWidget(
            hintText: 'stream key',
            initialValue: widget.config.streamKey,
            onChanged: (String value) {
              setState(() {
                _isChanged = true;
                widget.config.streamKey = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _TextInputFieldWidget extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final String hintText;
  final String initialValue;
  final Function(String) onChanged;

  _TextInputFieldWidget({
    super.key,
    required this.hintText,
    required this.initialValue,
    required this.onChanged,
  }) {
    controller.text = initialValue;
    controller.addListener(() {
      onChanged(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: IconButton(
          onPressed: () async {
            ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
            if (data == null) return;
            controller.text = data.text!;
          },
          icon: const Icon(Icons.paste),
        ),
      ),
    );
  }
}
