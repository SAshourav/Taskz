import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/home/widgets/dialogs/category_dialog.dart';
import '../../../features/home/widgets/dialogs/create_task_dialog.dart';
import '../../../reusable_designs/icons/icon_with_dialog_function.dart';
import '../../../utils/constants/sizes.dart';

class CustomDashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomDashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
        color: Theme.of(context).appBarTheme.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side: greeting texts
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good morning",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Sabbir !",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // Right side: two big icons
            Row(
              children: [
                IconButton(
                  icon: const Icon(Iconsax.notification_bing, size: 30),
                  onPressed: () {
                    // TODO: Notification action
                  },
                ),

                const SizedBox(width: TSizes.sm),
                PopupMenuIconButton(
                  icon: Icons.add,
                  items: const [
                    PopupMenuItemData(value: 'category', icon: Icons.category, title: 'Create New Category'),
                    PopupMenuItemData(value: 'task', icon: Icons.task, title: 'Create New Task'),
                  ],
                  onSelected: (value) {
                    if (value == 'category') {
                      showDialog(
                        context: context,
                        builder: (context) => const CreateCategoryDialog(),
                      );
                    } else if (value == 'task') {
                      showDialog(
                        context: context,
                        builder: (context) => const CreateTaskDialog(),
                      );
                    }
                  },


                ),


              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

