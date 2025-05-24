import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class ProgressBarWithCount extends StatelessWidget {
  const ProgressBarWithCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Progress Bar
        SizedBox(
          width: 80,
          height: 8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: LinearProgressIndicator(
              value: 3 / 6, // 50% progress
              backgroundColor: TColors.white.withOpacity(0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(TColors.lightOrange),
            ),
          ),
        ),
        const SizedBox(width: TSizes.sm),

        // Numeric Progress
        Text(
          "3/6",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: TColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}