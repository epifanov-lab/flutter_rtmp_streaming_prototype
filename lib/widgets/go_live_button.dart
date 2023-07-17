import 'package:flutter/material.dart';

class GoLiveEndStreamButtonWidget extends StatelessWidget {
  final bool isStreaming;
  final Function onTap;

  const GoLiveEndStreamButtonWidget({
    Key? key,
    required this.isStreaming,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Material(
          color: isStreaming ? Colors.white : Colors.blue,
          child: InkWell(
            onTap: () => onTap(),
            borderRadius: BorderRadius.circular(24),
            child: Center(
              child: Text(
                isStreaming ? 'End streaming' : 'Go live',
                style: TextStyle(
                  color: isStreaming ? Colors.blue : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}