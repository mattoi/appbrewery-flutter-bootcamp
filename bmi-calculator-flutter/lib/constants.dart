import 'package:flutter/material.dart';

final endPicture =
    Image.network('http://feijoadasimulator.top/br/sources/4311.jpeg');

abstract class UIColors {
  static const BOTTOM_CONTAINER = Color(0xFFEB1555);
  static const ACTIVE = Color(0xFF1D1E30);
  static const INACTIVE = Color(0xFF111328);
}

enum Gender { male, female }

const labelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);

const numberTextStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);
