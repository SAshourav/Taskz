import 'package:flutter/material.dart';
import 'package:taskz/features/home/widgets/task_with_time_dashboard.dart';

import '../../../common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class Today_todo extends StatelessWidget {
  const Today_todo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TRoundedContainer(
        width: 200,
        height: 310,
        backgroundColor: TColors.lightOrange,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Today", style: Theme.of(context).textTheme.displaySmall,),
            const SizedBox(height: TSizes.sm,),
            const ToDoTask(time: '9:50 AM', title: 'facetime',),
            const ToDoTask(time: '11:50 AM', title: 'hit gym',),
            const ToDoTask(time: '03:20 AM', title: 'design app',),
          ],
        ),
      ),
    );
  }
}