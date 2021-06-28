import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;
  final EdgeInsetsGeometry padding;

  const ReusableCard({
    @required this.color,
    this.child,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: padding,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: child,
        ),
      ),
    );
  }
}
