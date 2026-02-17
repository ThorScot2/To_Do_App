import 'package:flutter/material.dart';
import '../model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      title: "Buy groceries",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 3)),
      isDone: false,
    ),
    Task(
      title: "Finish Flutter project",
      priority: 3,
      deadline: DateTime.now().add(Duration(days: 1)),
      isDone: false,
    ),
    Task(
      title: "Call mom",
      priority: 1,
      deadline: DateTime.now().add(Duration(hours: 5)),
      isDone: true,
    ),
    Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),
    Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),
    Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),
    Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),
    Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),
    Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),
    Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),
    Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),
    Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),
    Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),
    Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),
    Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),
    Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),
    Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),
    Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),
    Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),
    Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),
    Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),
    Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),
    Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),
    Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),
  ]; //temp data for designing

  String _searchQuery = "";

  List<Task> get tasks {
    if (_searchQuery.isEmpty) return _tasks;

    return _tasks
        .where((task) =>
        task.title.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskDone(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }
}
