import 'package:flutter/material.dart';
import 'package:healthy_day_mobile/app_colors.dart';

class IconWithButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Widget? iconWidget;
  final Color iconColor;
  final Color? color;
  final VoidCallback onPressed;

  const IconWithButton({
    super.key,
    this.text,
    this.icon,
    this.iconWidget,
    this.iconColor = Colors.white,
    required this.onPressed,
    this.color,
  }) : assert(
         icon != null || iconWidget != null,
         'Either icon or iconWidget must be provided',
       );

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor = color ?? AppColors.onPrimary;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          backgroundColor: effectiveColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: onPressed,
        icon: iconWidget ?? Icon(icon, color: iconColor, size: 22),
        label: text != null
            ? Text(
                text!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
