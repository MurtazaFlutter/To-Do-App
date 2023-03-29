import 'package:flutter/material.dart';
import 'package:to_do/models/task_model.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get task => _tasks;

// Adding new task
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  //updating the extisting task
  void updateTask(Task task) {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    _tasks[index] = task;
  }

  // Deleting the task
  void deleteTask(Task task) {
    _tasks.removeWhere((t) => t.id == task.id);
    notifyListeners();
  }
}
