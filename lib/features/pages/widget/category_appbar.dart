import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../features/home/widgets/dialogs/create_task_dialog.dart';
import '../../../utils/constants/sizes.dart';

class CustomCategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomCategoryAppBar({
    super.key,
    this.title = 'Projects',
    this.leftIcon = Iconsax.arrow_left,
    this.rightIcon = Iconsax.edit,
    this.leftIconAction,
    this.rightIconAction,
    this.iconSize = TSizes.iconLg,
    this.titleStyle,
    this.iconColor = Colors.black,
    this.backgroundColor,
    this.circleBackgroundColor,
    this.appBarHeight = 60,
    this.showRightIcon = true, // New parameter to control right icon visibility
  });

  final String title;
  final IconData leftIcon;
  final IconData rightIcon;
  final VoidCallback? leftIconAction;
  final VoidCallback? rightIconAction;
  final double iconSize;
  final TextStyle? titleStyle;
  final Color iconColor;
  final Color? backgroundColor;
  final Color? circleBackgroundColor;
  final double appBarHeight;
  final bool showRightIcon; // New parameter

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
        color: backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor ?? Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side: Customizable icon
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleBackgroundColor ?? Colors.grey.withOpacity(0.1),
              ),
              child: IconButton(
                icon: Icon(leftIcon, size: iconSize),
                color: iconColor,
                onPressed: leftIconAction ?? () => Navigator.of(context).pop(),
              ),
            ),
            // Center: Customizable title
            Text(
              title,
              style: titleStyle ??
                  Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
            ),
            // Right side: Conditionally show the right icon
            showRightIcon
                ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleBackgroundColor ?? Colors.grey.withOpacity(0.1),
              ),
              child: IconButton(
                icon: Icon(rightIcon, size: iconSize),
                color: iconColor,
                onPressed: rightIconAction ??
                        () {
                      showDialog(
                        context: context,
                        builder: (context) => const CreateTaskDialog(),
                      );
                    },
              ),
            )
                : const SizedBox(width: TSizes.iconLg), // Placeholder to balance layout
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}