import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import '../../../../reusable_designs/widgets/progressbar_with_count.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class OngoingTaskDashboard extends StatelessWidget {
  final String taskTitle;
  final IconData icon;
  final Color containerBackgroundColor;
  final Color iconContainerColor;
  final Color iconColor;
  final Color textColor;
  final double containerHeight;
  final double iconContainerSize;
  final double iconSize;
  final double borderRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final TextStyle? textStyle;
  final Widget? progressWidget;

  const OngoingTaskDashboard({
    super.key,
    required this.taskTitle,
    required this.icon,
    this.containerBackgroundColor = TColors.primary,
    this.iconContainerColor = TColors.lightLavender,
    this.iconColor = TColors.black,
    this.textColor = TColors.black,
    this.containerHeight = 70.0,
    this.iconContainerSize = 50.0,
    this.iconSize = 28.0,
    this.borderRadius = 100.0,
    this.margin = const EdgeInsets.only(bottom: TSizes.md),
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.md),
    this.textStyle,
    this.progressWidget,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: double.infinity,
      height: containerHeight,
      margin: margin,
      backgroundColor: containerBackgroundColor,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: Icon + Text
          Row(
            children: [
              TRoundedContainer(
                width: iconContainerSize,
                height: iconContainerSize,
                radius: borderRadius,
                backgroundColor: iconContainerColor,
                child: Icon(icon, color: iconColor, size: iconSize),
              ),
              const SizedBox(width: TSizes.sm),
              Text(
                taskTitle,
                style: textStyle ??
                    Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),

          // Right Side: Progress Bar or Custom Widget
          progressWidget ?? const ProgressBarWithCount(),
        ],
      ),
    );
  }
}