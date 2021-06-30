import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  const RoundedButton(
      {@required this.text, @required this.color, @required this.onPressed});
  //final string destinationID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: color,
        child: MaterialButton(
          onPressed: onPressed,
          //maybe instead of receiving a full onPressed function, use pushnamed() and receive the next screen id?
          //onPressed: () {Navigation.pushNamed(context, DestinationScreen.id)},
          minWidth: 200.0,
          height: 42.0,
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
