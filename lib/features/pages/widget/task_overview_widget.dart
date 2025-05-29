import 'package:flutter/material.dart';
import 'package:taskz/features/pages/details.dart';
import 'package:taskz/reusable_designs/buttons/elevated_button.dart';
import '../../../common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import '../../../utils/constants/colors.dart';
import 'package:get/get.dart';

class TaskOverviewWidget extends StatelessWidget {
  const TaskOverviewWidget({
    super.key,
    required this.cardWidth,
    required this.taskName,
    this.progressValue = 0.6, // Default progress value
    this.unfinishedTasks = 4, // Default unfinished tasks
    this.onDetailsPressed, // Callback for button action
  });

  final double cardWidth;
  final String taskName;
  final double progressValue; // Progress value (0.0 to 1.0)
  final int unfinishedTasks; // Number of unfinished tasks
  final VoidCallback? onDetailsPressed; // Optional callback for Details button

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, ),
      width: cardWidth,
      height: 280,
      backgroundColor: const Color(0xFFADD8E6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Task Name
          Text(
            taskName,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: TColors.dark,
            ),
          ),
          const SizedBox(height: 10),
          // Task Progression with Circular Indicator
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: progressValue.clamp(0.0, 1.0), // Ensure value is between 0.0 and 1.0
                  strokeWidth: 10,
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  color: const Color(0xFF800080),
                ),
              ),
              Text(
                "Progress",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: TColors.dark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Number of unfinished tasks
          Text(
            "Unfinished task: $unfinishedTasks",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: TColors.dark,
            ),
          ),
          const SizedBox(height: 10),
          // Details button
          SAElevatedButton(text: "Details", onPressed: (){
            Get.to(()=>DetailsScreen());
          })
        ],
      ),
    );
  }
}