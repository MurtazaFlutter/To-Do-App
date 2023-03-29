import 'package:flutter/material.dart';
import 'package:to_do/models/task_model.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

// Adding new task
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  //updating the extisting task
  void updateTask(Task tasks) {
    final index = _tasks.indexWhere((t) => t.id == tasks.id);
    _tasks[index] = tasks;
    notifyListeners();
  }

  // Deleting the task
  void deleteTask(Task tasks) {
    _tasks.removeWhere((t) => t.id == tasks.id);
    notifyListeners();
  }

  // Refreshing the task List
  void refreshTask(List<Task> tasks) {
    _tasks.clear();
    _tasks.addAll(tasks);
    notifyListeners();
  }
}
