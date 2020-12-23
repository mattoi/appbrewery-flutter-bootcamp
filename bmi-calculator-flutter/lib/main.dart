import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E20),
        scaffoldBackgroundColor: Color(0xFF0A0E20),
        accentColor: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) =>
            ResultsPage(), // help: do I leave "nulL" here? / answer: it's optional if you change the constructor to the {} variant as i did
      },
    );
  }
}
