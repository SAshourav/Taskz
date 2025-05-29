import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../details.dart';

class OverviewContainer extends StatelessWidget {
  const OverviewContainer({
    super.key,
    required this.task,
    this.padding = const EdgeInsets.all(20),
    this.margin = const EdgeInsets.symmetric(vertical: 10),
    this.backgroundColor = Colors.white,
    this.borderRadius = 16.0,
    this.boxShadow,
    this.titleStyle,
    this.descriptionStyle,
    this.dueDateStyle,
    this.completionTextStyle,
    this.dueDateIcon = const Icon(Iconsax.calendar, color: Colors.grey),
    this.progressColor = Colors.green,
    this.progressBackgroundColor,
    this.progressHeight = 8.0,
    this.dateFormat = 'MMM dd, yyyy',
    this.onTap,
  });

  final Task task;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color backgroundColor;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? dueDateStyle;
  final TextStyle? completionTextStyle;
  final Widget dueDateIcon;
  final Color progressColor;
  final Color? progressBackgroundColor;
  final double progressHeight;
  final String dateFormat;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: boxShadow ?? [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Title
            Text(
              task.title,
              style: titleStyle ??
                  Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),

            // Task Description
            Text(
              task.description,
              style: descriptionStyle ?? Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),

            //curry Date Row
            Row(
              children: [
                dueDateIcon,
                const SizedBox(width: 10),
                Text(
                  'Due: ${DateFormat(dateFormat).format(task.dueDate)}',
                  style:
                  dueDateStyle ?? Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Progress Bar
            LinearProgressIndicator(
              value: task.completionPercentage,
              color: progressColor,
              backgroundColor:
              progressBackgroundColor ?? Colors.grey.shade300,
              minHeight: progressHeight,
            ),
            const SizedBox(height: 10),

            // Completion Text
            Text(
              '${(task.completionPercentage * 100).toInt()}% Completed',
              style: completionTextStyle ??
                  Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}