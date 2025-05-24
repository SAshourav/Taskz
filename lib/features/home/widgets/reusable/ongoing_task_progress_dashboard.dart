import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import '../../../../reusable_designs/widgets/progressbar_with_count.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class OngoingTaskDashboard extends StatelessWidget {
  const OngoingTaskDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: TSizes.md),
      backgroundColor: TColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: Icon + Text
          Row(
            children: [
              const TRoundedContainer(
                width: 50,
                height: 50,
                radius: 100,
                backgroundColor: TColors.lightLavender,
                child: Icon(Icons.design_services, color: TColors.black, size: 28),
              ),
              const SizedBox(width: TSizes.sm),
              Text(
                "UI Design",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: TColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // Right Side: Progress Bar + Progress Count
          ProgressBarWithCount(),
        ],
      ),
    );
  }
}