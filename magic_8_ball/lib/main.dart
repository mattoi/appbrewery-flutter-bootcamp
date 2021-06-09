import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Ball();
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = Random().nextInt(5) + 1;
  static const String TEXTO_TITULO = 'Week 2 Eden clear?';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(TEXTO_TITULO),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        child: Center(
          child: FlatButton(
            child: Image.asset('images/ball$ballNumber.png'),
            onPressed: () {
              setState(() {
                ballNumber = diffRandomNumber(ballNumber, 5) + 1;
                print('I got clicked! $ballNumber');
              });
            },
          ),
        ),
      ),
    );
  }
}

int diffRandomNumber(int previous, int max) {
  int next = previous;
  while (next == previous) {
    next = Random().nextInt(max);
  }
  return next;
}
