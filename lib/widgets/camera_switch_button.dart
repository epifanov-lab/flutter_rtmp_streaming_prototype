import 'package:flutter/material.dart';
import 'package:flutter_rtmp_streaming_prototype/widgets/tap_area_widget.dart';

class CameraSwitchButtonWidget extends StatelessWidget {
  final Function onTap;

  const CameraSwitchButtonWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TapAreaWidget(
      onTap: onTap,
      child: const Icon(
        Icons.sync,
        color: Colors.white,
      ),
    );
  }
}
