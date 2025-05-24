import 'package:flutter/material.dart';

class OutlineButtonWithText extends StatelessWidget {
  const OutlineButtonWithText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.add, size: 24), // Larger icon
      label: const Text(
        "Add",
        style: TextStyle(
          fontSize: 16, // Larger text
          fontWeight: FontWeight.w600,
        ),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        side: const BorderSide(width: 1.5), // Optional: bolder border
      ),
    );
  }
}