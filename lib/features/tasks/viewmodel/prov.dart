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
  bool _sortDescending = true;
  bool _hideCompleted = false;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskDone(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleSort() {
    _sortDescending = !_sortDescending;
    notifyListeners();
  }

  void toggleHideCompleted() {
    _hideCompleted = !_hideCompleted;
    notifyListeners();
  }

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  // PRIVATE LISTS FOR UI OR ACTIONS ON PUBLIC LISTS
  List<Task> get _filteredTasks {
    return _tasks.where((task) {
      final matchesSearch = task.title.toLowerCase().contains(
        _searchQuery.toLowerCase(),
      );

      final matchesHide = _hideCompleted ? !task.isDone : true;

      return matchesSearch && matchesHide;
    }).toList();
  }

  List<Task> get _sortedTasks {
    final list = _filteredTasks;

    list.sort(
      (a, b) => _sortDescending
          ? b.priority.compareTo(a.priority)
          : a.priority.compareTo(b.priority),
    );

    return list;
  }

  //PUBLIC LISTS FOR UI
  List<Task> get pendingTasks => _sortedTasks.where((t) => !t.isDone).toList();

  List<Task> get completedTasks => _sortedTasks.where((t) => t.isDone).toList();
}
