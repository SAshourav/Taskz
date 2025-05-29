// Flutter beginner-friendly task details screen with large text and elegant UI
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:taskz/features/pages/widget/category_appbar.dart';
import 'package:taskz/features/pages/widget/detailsPage/task_overview_container.dart';
import 'package:taskz/features/pages/widget/detailsPage/task_plan_widget.dart';
import 'package:taskz/utils/constants/colors.dart';
import 'package:taskz/utils/constants/sizes.dart';

class Task {
  final String title;
  final String description;
  final DateTime dueDate;
  final double completionPercentage;
  final List<String> plans;
  final List<SubTask> subtasks;
  final List<String> comments;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.completionPercentage,
    required this.plans,
    required this.subtasks,
    required this.comments,
  });
}

class SubTask {
  final String title;
  final bool isCompleted;

  SubTask({required this.title, this.isCompleted = false});
}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Task task;
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _subtaskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    task = Task(
      title: "Front-end Development",
      description: "Build responsive UI with animations for the dashboard.",
      dueDate: DateTime.now().add(const Duration(days: 5)),
      completionPercentage: 0.65,
      plans: [
        "Complete wireframes",
        "Implement responsive design",
        "Add animations"
      ],
      subtasks: [
        SubTask(title: "Wireframes", isCompleted: true),
        SubTask(title: "Nav bar", isCompleted: true),
        SubTask(title: "Animations", isCompleted: false),
      ],
      comments: [
        "Responsive issues on small screens.",
        "Need to optimize animation performance."
      ],
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    _subtaskController.dispose();
    super.dispose();
  }

  void _addSubtask(String title) {
    setState(() {
      task.subtasks.add(SubTask(title: title));
    });
    _subtaskController.clear();
  }

  void _toggleSubtask(int index) {
    setState(() {
      task.subtasks[index] = SubTask(
        title: task.subtasks[index].title,
        isCompleted: !task.subtasks[index].isCompleted,
      );
    });
  }

  void _addComment(String comment) {
    if (comment.trim().isNotEmpty) {
      setState(() {
        task.comments.add(comment);
      });
      _commentController.clear();
    }
  }

  void _showAddSubtaskDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Subtask'),
        content: TextField(
          controller: _subtaskController,
          decoration: const InputDecoration(
            hintText: 'Enter subtask',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_subtaskController.text.isNotEmpty) {
                _addSubtask(_subtaskController.text);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.light,
      appBar: CustomCategoryAppBar(title: "Task Details", showRightIcon: false,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task overview part

            OverviewContainer(task: task),

            const SizedBox(height: TSizes.md),

            TaskPlanWidget(task: task),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtasks', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Iconsax.add, color: Colors.blue),
                  onPressed: _showAddSubtaskDialog,
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...task.subtasks.asMap().entries.map((entry) {
              final i = entry.key;
              final sub = entry.value;
              return CheckboxListTile(
                title: Text(
                  sub.title,
                  style: TextStyle(
                    fontSize: 16,
                    decoration: sub.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                value: sub.isCompleted,
                onChanged: (_) => _toggleSubtask(i),
              );
            }),

            const SizedBox(height: 30),
            Text('Comments', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...task.comments.map((comment) => ListTile(
              leading: const Icon(Iconsax.message, color: Colors.grey),
              title: Text(comment),
            )),

            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                        hintText: 'Write a comment...'
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Iconsax.send_2, color: Colors.blue),
                  onPressed: () => _addComment(_commentController.text),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


