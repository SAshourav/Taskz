import 'package:flutter/material.dart';
import 'package:taskz/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:taskz/features/pages/details.dart';
import 'package:taskz/features/pages/widget/category_appbar.dart';
import 'package:taskz/features/pages/widget/task_overview_widget.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate the width for each card (half of the screen width minus margins)
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = (screenWidth - 30) / 2; // Subtract total margin (10 on each side + 10 between cards)

    return Scaffold(
      appBar: CustomCategoryAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 10, // Vertical spacing between rows
            spacing: 10, // Horizontal spacing between cards
            children: List.generate(4, (index) {
              // Generate unique task names and data for each card
              final taskNames = ['Front-end', 'Back-end', 'Design', 'Testing'];
              final progressValues = [0.6, 0.4, 0.8, 0.3];
              final unfinishedTasks = [4, 3, 2, 5];

              return TaskOverviewWidget(
                cardWidth: cardWidth,
                taskName: taskNames[index],
                progressValue: progressValues[index],
                unfinishedTasks: unfinishedTasks[index],
                onDetailsPressed: () {
                  print('Details pressed for ${taskNames[index]}');
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}