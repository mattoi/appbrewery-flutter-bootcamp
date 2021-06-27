import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(home: BallPage()));

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Ball();
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = Random().nextInt(5) + 1;
  static const String kTitleText = 'Week 2 Eden clear?';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(kTitleText),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        child: Center(
          child: FlatButton(
            child: Image.asset('images/ball$ballNumber.png'),
            onPressed: () {
              setState(() => ballNumber = diffRandomNumber(ballNumber, 5) + 1);
            },
          ),
        ),
      ),
    );
  }
}

int diffRandomNumber(int previous, int max) {
  // getting the same result twice would be underwhelming, but in real life it could happen
  int next = previous;
  while (next == previous) next = Random().nextInt(max);
  return next;
}
