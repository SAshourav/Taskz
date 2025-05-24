import 'package:flutter/material.dart';
import 'package:taskz/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:taskz/features/home/widgets/all_task_widget_dashboard.dart';
import 'package:taskz/features/home/widgets/in_progress_widget_dashboard.dart';
import 'package:taskz/features/home/widgets/reusable/ongoing_task_progress_dashboard.dart';
import 'package:taskz/features/home/widgets/today_todo_dashboard.dart';
import 'package:taskz/utils/constants/colors.dart';
import 'package:taskz/utils/constants/sizes.dart';
import '../../common/widgets/appbar/dashboard_appbar.dart';
import '../../reusable_designs/texts/section_heading_with_button.dart';
import '../../reusable_designs/widgets/progressbar_with_count.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: TColors.secondary,
      appBar: CustomDashboardAppBar(),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // First Segment
            Row(
              children: [
                Today_todo(),
                SizedBox(width: TSizes.sm,),
                Expanded(
                  child: Column(
                    children: [
                      AllTaskListWidget(),

                      SizedBox(height: TSizes.sm,),
                      InProgressWidget(),
                    ],
                  ),
                )
              ],
            ),
            // Second Segment Title
            SizedBox(height: TSizes.spaceBtwSections,),
            SectionHeadingWithButton(),

            // Second Segment Elements
            SizedBox(height: TSizes.spaceBtwSections,),
            OngoingTaskDashboard(),
            OngoingTaskDashboard(),
            OngoingTaskDashboard(),

          ],
        ),
      ),
    );
  }
}















