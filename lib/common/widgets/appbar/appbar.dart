import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title = const Text(''),
    this.showbackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget title;
  final bool showbackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: 12),
      decoration: BoxDecoration(
        color: dark ? Colors.black : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// Back or Leading Icon
            if (showbackArrow || leadingIcon != null)
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: leadingOnPressed ?? () => Get.back(),
                  icon: Icon(
                    showbackArrow ? Iconsax.arrow_left_2 : leadingIcon,
                    size: 28,
                    color: dark ? Colors.white : const Color(0xFF333333),
                  ),
                ),
              ),

            /// Center Title
            Center(
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: dark ? Colors.white : Colors.black,
                ),
                child: title,
              ),
            ),

            /// Right-side Actions
            if (actions != null)
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: actions!,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
