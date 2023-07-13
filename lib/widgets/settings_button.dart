import 'package:flutter/material.dart';
import 'package:flutter_rtmp_streaming_prototype/widgets/tap_area_widget.dart';

class SettingsButtonWidget extends StatelessWidget {
  final Function onTap;

  const SettingsButtonWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TapAreaWidget(
      onTap: onTap,
      child: const Icon(
        Icons.settings,
        color: Colors.white,
      ),
    );
  }
}
