import 'package:flutter/material.dart';

import '../buttons/outline_button_with_text.dart';

class SectionHeadingWithButton extends StatelessWidget {
  const SectionHeadingWithButton({
    super.key,
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
              "Projects",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              "You have 3 ongoing projects",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const OutlineButtonWithText(),
      ],
    );
  }
}