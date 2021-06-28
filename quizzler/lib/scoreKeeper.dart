import 'package:flutter/material.dart';

class ScoreKeeper {
  List<Icon> _scores = [];
  int _numCorrectAnswers = 0;

  List<Icon> get scores => _scores;
  int get numCorrectAnswers => _numCorrectAnswers;

  void add(bool isCorrect) {
    if (scores.length < 16) {
      if (isCorrect) {
        _scores.add(Icon(Icons.check, color: Colors.green));
        _numCorrectAnswers++;
      } else
        _scores.add(Icon(Icons.close, color: Colors.red));
    }
  }

  void reset() {
    _scores.clear();
    _numCorrectAnswers = 0;
  }
}
