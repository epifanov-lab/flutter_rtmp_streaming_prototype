import 'package:flutter/material.dart';
import 'package:flutter_rtmp_streaming_prototype/widgets/tap_area_widget.dart';

class CloseButtonWidget extends StatelessWidget {
  final Function onTap;

  const CloseButtonWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TapAreaWidget(
      onTap: onTap,
      size: 24,
      color: Colors.transparent,
      child: const Icon(
        Icons.close,
        color: Colors.black,
      ),
    );
  }
}
