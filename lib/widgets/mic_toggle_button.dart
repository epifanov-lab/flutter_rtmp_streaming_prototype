import 'package:flutter/material.dart';
import 'package:flutter_rtmp_streaming_prototype/widgets/tap_area_widget.dart';

class MicToggleButtonWidget extends StatelessWidget {
  final bool isMicEnabled;
  final Function onTap;

  const MicToggleButtonWidget({
    super.key,
    required this.isMicEnabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TapAreaWidget(
      onTap: onTap,
      child: Icon(
        isMicEnabled ? Icons.mic : Icons.mic_off,
        color: Colors.white,
      ),
    );
  }
}
