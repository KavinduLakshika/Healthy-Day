import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final double value;
  final double height;
  final Color backgroundColor;
  final Color progressColor;
  final BorderRadiusGeometry borderRadius;
  final Duration animationDuration;

  const Progress({
    super.key,
    required this.value,
    this.height = 8,
    this.backgroundColor = const Color(0x332196F3),
    this.progressColor = const Color(0xFF2196F3),
    this.borderRadius = const BorderRadius.all(Radius.circular(9999)),
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    final progress = value.clamp(0, 100) / 100;

    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        height: height,
        width: double.infinity,
        color: backgroundColor,
        child: Align(
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            duration: animationDuration,
            curve: Curves.easeInOut,
            width: progress * MediaQuery.of(context).size.width,
            color: progressColor,
          ),
        ),
      ),
    );
  }
}
