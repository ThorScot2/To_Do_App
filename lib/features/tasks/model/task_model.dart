import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final DateTime? deadline;

  @HiveField(2)
  final int priority;

  @HiveField(3)
  bool isDone;

  Task({
    required this.title,
    required this.priority,
    this.deadline,
    this.isDone = false,
  });
}
