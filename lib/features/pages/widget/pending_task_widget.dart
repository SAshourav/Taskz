import 'package:flutter/material.dart';
import 'package:taskz/features/pages/pending_task_page.dart';

import '../../../common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class PendingTaskWidget extends StatelessWidget {
  const PendingTaskWidget({
    super.key, required Task task,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tapped: Design The Dashboard')),
        );
      },
      child: TRoundedContainer(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: TColors.primary,
        width: double.infinity,
        height: 80,
        child: Row(
          children: [
            /// Left Section (Expanded)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dashboard making",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: TColors.dark,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: TSizes.xs),
                  Text(
                    "App design",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: TColors.lightOrange,
                    ),
                  ),
                ],
              ),
            ),

            /// Right Section (No Expanded to avoid overflow)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm,
                    vertical: TSizes.xs,
                  ),
                  decoration: BoxDecoration(
                    color: TColors.warning.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
                  ),
                  child: Text(
                    'Pending',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: TColors.warning,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.sm),
                Text(
                  'Due 27 May',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.red,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}