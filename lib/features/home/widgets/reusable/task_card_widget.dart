import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key,
    required this.taskCount,
    required this.label,
    this.icon = Icons.task_alt,
    this.iconColor = Colors.purple,
    this.textColor = Colors.purple,
    this.taskCountColor = TColors.darkGrey,
    this.backgroundColor = TColors.lightLavender,
    this.onTap, // Added optional onTap callback
  });

  final String taskCount;
  final String label;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final Color taskCountColor;
  final Color backgroundColor;
  final VoidCallback? onTap; // Nullable callback for tap events

  @override
  Widget build(BuildContext context) {
    // Wrap the AnimatedContainer in a GestureDetector if onTap is provided
    Widget cardContent = AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: Icon(
                icon,
                key: const ValueKey<int>(0),
                size: 48,
                color: iconColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              taskCount,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                color: taskCountColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );

    // Conditionally wrap with GestureDetector if onTap is not null
    return onTap != null
        ? GestureDetector(
      onTap: onTap,
      child: cardContent,
    )
        : cardContent;
  }
}