import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  DicePageState createState() => DicePageState();
}

class DicePageState extends State<DicePage> {
  int leftDiceNumber = Random().nextInt(6) + 1;
  int rightDiceNumber = Random().nextInt(6) + 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: <Widget>[
        Expanded(
          child: FlatButton(
            child: Image.asset('images/dice$leftDiceNumber.png'),
            onPressed: () {
              setState(rollBoth);
            },
          ),
        ),
        Expanded(
          child: FlatButton(
            child: Image.asset('images/dice$rightDiceNumber.png'),
            onPressed: () {
              setState(rollBoth);
            },
          ),
        ),
      ]),
    );
  }

  void rollBoth() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }
}
