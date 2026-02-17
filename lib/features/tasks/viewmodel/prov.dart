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
    ),Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),Task(
      title: "Workout",
      priority: 2,
      deadline: DateTime.now().add(Duration(hours: 1)),
      isDone: true,
    ),Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),Task(
      title: "Read book",
      priority: 1,
      deadline: DateTime.now().add(Duration(days: 2)),
      isDone: false,
    ),


  ];//temp data for designing


  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskDone(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }
}
