import 'package:flutter/material.dart';
import 'package:to_do_app/Settings/App_Colors.dart';

class TaskCard extends StatefulWidget {
  final String title;
  final int priority;
  final DateTime deadline;
  final bool isDone;
  final VoidCallback? onToggleDone;

  const TaskCard({
    super.key,
    required this.title,
    required this.deadline,
    required this.priority,
    required this.isDone,
    this.onToggleDone,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  String getPriorityName(int priority) {
    //set priority name for show
    switch (priority) {
      case 3:
        return "High";
      case 2:
        return "Medium";
      case 1:
        return "Low";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColors.toDoCardColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                //done button
                onPressed: widget.onToggleDone,
                icon: Icon(
                  widget.isDone ? Icons.check_circle : Icons.circle_outlined,
                  color: widget.isDone
                      ? AppColors.checkedTaskColor
                      : Colors.grey,
                ),
              ),
              Text(
                widget.title,
                style: TextStyle(color: AppColors.fontColor, fontSize: 16),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Column(
              children: [
                Text(
                  "${widget.deadline.day}/${widget.deadline.month}/${widget.deadline.year}", //deadline date
                  style: TextStyle(color: AppColors.fontColor),
                ),
                Text(
                  getPriorityName(widget.priority),
                  style: TextStyle(color: AppColors.fontColor),
                ), //priority
              ],
            ),
          ),
        ],
      ),
    );
  }
}
