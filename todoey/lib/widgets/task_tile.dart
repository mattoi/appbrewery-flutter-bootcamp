import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function checkboxCallback;
  final Function longPressCallback;
  TaskTile(
      {@required this.task, this.checkboxCallback, this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        task.description,
        style: TextStyle(
            color: kDescriptionColor,
            decoration:
                task.isDone ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        activeColor: kBackgroundColor,
        value: task.isDone,
        onChanged: checkboxCallback,
      ),
    );
  }
}
