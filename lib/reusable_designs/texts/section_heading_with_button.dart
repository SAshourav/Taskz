import 'package:flutter/material.dart';
import 'package:taskz/features/pages/category.dart';
import '../buttons/outline_button_with_text.dart';
import 'package:get/get.dart';

class SectionHeadingWithButton extends StatelessWidget {
  final String headingText;
  final String subtitleText;
  final bool showButton;
  final bool showSubtitle; // New parameter to control subtitle visibility
  final OutlineButtonWithText? button;
  final TextStyle? headingStyle;
  final TextStyle? subtitleStyle;

  const SectionHeadingWithButton({
    super.key,
    required this.headingText,
    required this.subtitleText,
    this.showButton = true,
    this.showSubtitle = true, // Default to true for backward compatibility
    this.button,
    this.headingStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => const Category());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headingText,
                style: headingStyle ?? Theme.of(context).textTheme.displaySmall,
              ),
              if (showSubtitle) // Conditionally show subtitle
                Text(
                  subtitleText,
                  style: subtitleStyle ?? Theme.of(context).textTheme.bodyMedium,
                ),
            ],
          ),
        ),
        if (showButton)
          button ??
              const OutlineButtonWithText(
                labelText: 'Add',
                icon: Icons.add,
              ),
      ],
    );
  }
}