import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final double size;
  final Color color;
  final IconData icon;
  final Function onPressed;
  static const defaultColor = Color(0xFF4C4F5E);

  const RoundIconButton({
    this.size = 56.0,
    this.color = defaultColor,
    @required this.icon,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: size, height: size),
      shape: CircleBorder(),
      elevation: 0,
      fillColor: color,
      child: Icon(icon),
      onPressed: onPressed,
    );
  }
}
