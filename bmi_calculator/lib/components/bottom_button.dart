import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const BottomButton({this.label, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 75,
      child: RaisedButton(
        color: UIColors.bottomContainer,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
