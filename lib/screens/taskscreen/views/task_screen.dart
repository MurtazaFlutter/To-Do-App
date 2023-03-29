import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_model.dart';

import '../../../providers/task_provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return Scaffold(
        body: ListView.builder(
            itemCount: taskProvider.task.length,
            itemBuilder: (context, index) {
              final task = taskProvider.task[index];
              return ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: Checkbox(
                  value: task.isCompleted,
                  onChanged: (valye) {
                    final updateTask = Task(
                        id: task.id,
                        title: task.title,
                        description: task.description,
                        isCompleted: task.isCompleted);
                    taskProvider.updateTask(updateTask);
                  },
                ),
              );
            }));
  }
}
