import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../features/home/widgets/dialogs/create_task_dialog.dart';
import '../../../utils/constants/sizes.dart';

class CustomCategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomCategoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
        color: Theme.of(context).appBarTheme.backgroundColor ?? Colors.white, // Match the white background
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side: Back button with circular background
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.1), // Light grey circular background
              ),
              child: IconButton(
                icon: const Icon(Iconsax.arrow_left, size: TSizes.iconLg), // Smaller back arrow
                color: Colors.black, // Black icon color
                onPressed: () => Navigator.of(context).pop(), // Navigate back
              ),
            ),
            // Center: Project title
            Text(
              "Projects",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600, // Slightly bold
                color: Colors.black, // Black text
              ),
            ),
            // Right side: Edit icon with circular background
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.1), // Light grey circular background
              ),
              child: IconButton(
                icon: const Icon(Iconsax.edit, size: TSizes.iconLg), // Edit icon
                color: Colors.black, // Black icon color
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const CreateTaskDialog(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60); // Adjusted height to match design
}