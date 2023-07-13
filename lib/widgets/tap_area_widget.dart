import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TapAreaWidget extends StatelessWidget {
  final Widget child;
  final Function onTap;

  const TapAreaWidget({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: const Color(0x4D232323),
        child: InkWell(
          onTap: () => onTap.call(),
          child: SizedBox(
            width: 48,
            height: 48,
            child: child,
          ),
        ),
      ),
    );
  }
}
