import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(description: 'Buy milk'),
    Task(description: 'Buy eggs'),
    Task(description: 'Buy detergent'),
  ];
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
  int get numTasks => _tasks.length;
  int numTasksLeft = 0;
  void updateTasksLeft() {
    numTasksLeft = 0;
    for (var task in _tasks) if (!task.isDone) numTasksLeft++;
    notifyListeners();
  }

  void addTask(String description) {
    _tasks.add(Task(description: description));
    updateTasksLeft();
  }

  void toggleTask(Task task) {
    task.toggleDone();
    updateTasksLeft();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    updateTasksLeft();
  }
}
