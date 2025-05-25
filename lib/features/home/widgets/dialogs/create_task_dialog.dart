import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTaskDialog extends StatefulWidget {
  const CreateTaskDialog({super.key});

  @override
  State<CreateTaskDialog> createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  final _taskNameController = TextEditingController();
  final _taskDetailController = TextEditingController();
  String? _selectedCategory;
  DateTime? _startDate;
  DateTime? _endDate;
  final List<TextEditingController> _subtaskControllers = [TextEditingController()];

  // Simulated category list
  final List<String> _categories = ['Work', 'Personal', 'Urgent'];

  Future<void> _pickDate({required bool isStart}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _addSubtaskField() {
    setState(() {
      _subtaskControllers.add(TextEditingController());
    });
  }

  void _saveTask() {
    // Extract data and handle saving
    final name = _taskNameController.text.trim();
    final details = _taskDetailController.text.trim();

    if (name.isNotEmpty && _selectedCategory != null) {
      Navigator.pop(context);
      print("Task Name: $name");
      print("Details: $details");
      print("Category: $_selectedCategory");
      print("Start: $_startDate | End: $_endDate");
      print("Subtasks:");
      for (var controller in _subtaskControllers) {
        if (controller.text.trim().isNotEmpty) {
          print("- ${controller.text.trim()}");
        }
      }
      // Add attachment logic
    }
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _taskDetailController.dispose();
    for (var controller in _subtaskControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create New Task"),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Name
            TextField(
              controller: _taskNameController,
              decoration: const InputDecoration(
                labelText: "Task Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Task Details
            TextField(
              controller: _taskDetailController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Task Details",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Category Dropdown
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _categories.map((cat) => DropdownMenuItem(value: cat, child: Text(cat))).toList(),
              onChanged: (val) => setState(() => _selectedCategory = val),
              decoration: const InputDecoration(
                labelText: "Category",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Start & End Date
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _pickDate(isStart: true),
                    child: Text(_startDate == null
                        ? "Start Date"
                        : DateFormat.yMMMd().format(_startDate!)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _pickDate(isStart: false),
                    child: Text(_endDate == null
                        ? "End Date"
                        : DateFormat.yMMMd().format(_endDate!)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Attachment Add
            OutlinedButton.icon(
              onPressed: () {
                // Add attachment logic
              },
              icon: const Icon(Icons.attach_file),
              label: const Text("Add Attachment"),
            ),
            const SizedBox(height: 12),

            // Subtasks
            const Text("Subtasks", style: TextStyle(fontWeight: FontWeight.bold)),
            ..._subtaskControllers.map((controller) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Subtask",
                  border: OutlineInputBorder(),
                ),
              ),
            )),
            TextButton.icon(
              onPressed: _addSubtaskField,
              icon: const Icon(Icons.add),
              label: const Text("Add Subtask"),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: _saveTask,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text("Save", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
