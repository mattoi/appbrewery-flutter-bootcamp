import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  final Icon icon;
  final String label;

  const IconContent({this.icon, this.label}) : assert(icon != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(height: 15),
        Text(label, style: labelTextStyle),
      ],
    );
  }
}
