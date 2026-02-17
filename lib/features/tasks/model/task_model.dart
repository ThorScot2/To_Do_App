import 'package:flutter/material.dart';

class Task {
  final String title;
  final dynamic deadline;
  final int priority;
  bool isDone;

  Task({
    required this.title,
    required this.priority,
    this.deadline,
    this.isDone = false,
  });
}
