import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TapAreaWidget extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final double size;
  final Color color;

  const TapAreaWidget({
    super.key,
    required this.onTap,
    required this.child,
    this.size = 48,
    this.color = const Color(0x4D232323),
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          onTap: () => onTap.call(),
          child: SizedBox(
            width: size,
            height: size,
            child: child,
          ),
        ),
      ),
    );
  }
}
