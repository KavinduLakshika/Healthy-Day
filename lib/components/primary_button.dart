import 'package:flutter/material.dart';
import 'package:healthy_day_mobile/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;
  final IconData? icon;
  final bool iconAfter;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.width,
    this.height,
    this.icon,
    this.iconAfter = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor = color ?? AppColors.primary;
    final Color effectiveTextColor = textColor ?? AppColors.onPrimary;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null && !iconAfter) ...[
              Icon(icon, size: 20, color: effectiveTextColor),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                color: effectiveTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (icon != null && iconAfter) ...[
              const SizedBox(width: 8),
              Icon(icon, size: 20, color: effectiveTextColor),
            ],
          ],
        ),
      ),
    );
  }
}
