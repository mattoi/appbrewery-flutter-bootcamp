import 'package:flutter/material.dart';

class Task {
  String description;
  bool _isDone = false;
  bool get isDone => _isDone;
  Task({@required this.description});

  void toggleDone() {
    _isDone = !_isDone;
  }
}
