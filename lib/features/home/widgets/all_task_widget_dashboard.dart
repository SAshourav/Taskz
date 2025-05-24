import 'package:flutter/material.dart';
import 'package:taskz/features/home/widgets/reusable/task_card_widget.dart';

import '../../../utils/constants/colors.dart';

class AllTaskListWidget extends StatelessWidget {
  const AllTaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskCardWidget(
      taskCount: "15 tasks",
      label: "Pending Tasks",
      icon: Icons.check_circle,
      iconColor: Colors.black54,
      backgroundColor: TColors.lightLavender,
    );
  }
}