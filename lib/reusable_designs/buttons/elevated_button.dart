import 'package:flutter/material.dart';

enum SAButtonSize { small, medium, large }

class SAElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isExpanded;
  final SAButtonSize size;

  const SAElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isExpanded = false,
    this.size = SAButtonSize.medium,
  });

  double _getVerticalPadding() {
    switch (size) {
      case SAButtonSize.small:
        return 10;
      case SAButtonSize.large:
        return 20;
      case SAButtonSize.medium:
      default:
        return 14;
    }
  }

  double _getFontSize() {
    switch (size) {
      case SAButtonSize.small:
        return 14;
      case SAButtonSize.large:
        return 18;
      case SAButtonSize.medium:
      default:
        return 16;
    }
  }

  @override
  Widget build(BuildContext context) {
    final childContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null)
          Icon(icon, size: _getFontSize(), color: Colors.white),
        if (icon != null)
          const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: _getFontSize(),
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );

    return SizedBox(
      width: isExpanded ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 6,
          shadowColor: Colors.deepPurple.shade200,
          padding: EdgeInsets.symmetric(
            vertical: _getVerticalPadding(),
            horizontal: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: childContent,
      ),
    );
  }
}
