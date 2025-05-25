import 'package:flutter/material.dart';
import 'package:taskz/reusable_designs/buttons/elevated_button.dart';
import 'package:taskz/utils/constants/colors.dart';

class CreateCategoryDialog extends StatefulWidget {
  const CreateCategoryDialog({super.key});

  @override
  State<CreateCategoryDialog> createState() => _CreateCategoryDialogState();
}

class _CreateCategoryDialogState extends State<CreateCategoryDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveCategory() {
    final name = _controller.text.trim();
    if (name.isNotEmpty) {
      Navigator.pop(context); // Close dialog
      // Add your logic here to save category
      print("New Category: $name");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Create New Category", style: Theme.of(context).textTheme.headlineMedium,),
      content:SizedBox(
      height: 80, // Increases input field height
      child: TextField(
        controller: _controller,
        style: const TextStyle(
          fontSize: 18,              // Input text size
        ),
        decoration: const InputDecoration(
          labelText: 'Category Name',
          labelStyle: TextStyle(fontSize: 16), // Label size
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
              vertical: 20, horizontal: 16), // Increases padding inside the field
        ),
      ),
    ),

    actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        SAElevatedButton(text: 'Save', onPressed: (){}, size: SAButtonSize.large,)

      ],
    );
  }
}
