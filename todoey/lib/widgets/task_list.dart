import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          itemCount: taskData.numTasks,
          itemBuilder: (context, index) => TaskTile(
            task: taskData.tasks[index],
            checkboxCallback: (isDone) =>
                taskData.toggleTask(taskData.tasks[index]),
            longPressCallback: () =>
                taskData.removeTask(taskData.tasks[index]),
          ),
        );
      },
    );
  }
}
