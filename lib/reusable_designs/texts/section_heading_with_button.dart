import 'package:flutter/material.dart';
import '../buttons/outline_button_with_text.dart';

class SectionHeadingWithButton extends StatelessWidget {
  final String headingText;
  final String subtitleText;
  final bool showButton;
  final OutlineButtonWithText? button;
  final TextStyle? headingStyle;
  final TextStyle? subtitleStyle;

  const SectionHeadingWithButton({
    super.key,
    required this.headingText,
    required this.subtitleText,
    this.showButton = true,
    this.button,
    this.headingStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headingText,
              style: headingStyle ?? Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              subtitleText,
              style: subtitleStyle ?? Theme.of(context).textTheme.bodyMedium,
            ),
          ],
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