import 'package:flutter/material.dart';
import 'package:taskz/features/pages/widget/pending_task_widget.dart';
import 'package:taskz/utils/constants/sizes.dart';
import 'package:taskz/features/pages/widget/category_appbar.dart';

class Task {
  final String title;
  final DateTime dueDate;

  Task({required this.title, required this.dueDate});
}


class PendingTaskPage extends StatefulWidget {
  const PendingTaskPage({super.key});

  @override
  State<PendingTaskPage> createState() => _PendingTaskPageState();
}

class _PendingTaskPageState extends State<PendingTaskPage> {
  String _sortType = "Due Date";

  // Sample data
  List<Task> _tasks = [
    Task(title: "Write Report", dueDate: DateTime(2025, 6, 10)),
    Task(title: "Meeting with Team", dueDate: DateTime(2025, 6, 3)),
    Task(title: "Buy Groceries", dueDate: DateTime(2025, 6, 5)),
    Task(title: "Doctor Appointment", dueDate: DateTime(2025, 6, 2)),
  ];

  void _toggleSort() {
    setState(() {
      if (_sortType == "Due Date") {
        _sortType = "Alphabetical";
        _tasks.sort((a, b) => a.title.compareTo(b.title));
      } else {
        _sortType = "Due Date";
        _tasks.sort((a, b) => a.dueDate.compareTo(b.dueDate));
      }
    });
  }

  void _openFilter() {
    // Example filter: show tasks due within 7 days
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Apply Filter"),
        content: const Text("Show tasks due within 7 days?"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _tasks = _tasks
                    .where((task) =>
                    task.dueDate.isBefore(DateTime.now().add(Duration(days: 7))))
                    .toList();
              });
              Navigator.pop(context);
            },
            child: const Text("Apply"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomCategoryAppBar(
        title: 'Pending Task',
        showRightIcon: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Sort and Filter Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: _toggleSort,
                    icon: const Icon(Icons.sort),
                    label: Text('Sort ($_sortType)'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: _openFilter,
                    icon: const Icon(Icons.filter_list),
                    label: const Text('Filter'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // Render tasks
              Column(
                children: _tasks
                    .map((task) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: PendingTaskWidget(task: task),
                ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



