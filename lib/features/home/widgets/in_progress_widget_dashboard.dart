import 'package:flutter/material.dart';
import 'package:taskz/features/home/widgets/reusable/task_card_widget.dart';
import '../../../utils/constants/colors.dart';

class InProgressWidget extends StatelessWidget {
  const InProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TaskCardWidget(
        taskCount: '30 tasks',
        label: "In Progress",
        backgroundColor: TColors.primary,
      iconColor: Colors.black54,
      icon: Icons.hourglass_empty,
    );
  }
}