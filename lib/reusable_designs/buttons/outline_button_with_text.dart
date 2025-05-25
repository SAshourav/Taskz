import 'package:flutter/material.dart';

class OutlineButtonWithText extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final TextStyle? textStyle;
  final double iconSize;
  final EdgeInsets padding;

  const OutlineButtonWithText({
    super.key,
    required this.labelText,
    required this.icon,
    this.onPressed,
    this.borderColor = Colors.blue,
    this.borderWidth = 1.5,
    this.borderRadius = 30.0,
    this.textStyle,
    this.iconSize = 24.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: iconSize),
      label: Text(
        labelText,
        style: textStyle ??
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        side: BorderSide(
          color: borderColor,
          width: borderWidth,
        ),
      ),
    );
  }
}