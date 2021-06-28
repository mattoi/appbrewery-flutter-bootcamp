import 'dart:math';

class BMIRange {
  final String name;
  final String description;

  BMIRange(this.name, this.description);
}

Map<String, BMIRange> bmiRanges = {
  'UNDERWEIGHT': BMIRange('UNDERWEIGHT',
      'You have a lower than normal body weight. You can eat a bit more.'),
  'HEALTHY': BMIRange('HEALTHY', 'You have a normal body weight. Nice!'),
  'OVERWEIGHT': BMIRange('OVERWEIGHT',
      'You have a higher than normal body weight. Try to exercise more.'),
};

abstract class BMICalculator {
  static double calculateBMI(double height, int weight) =>
      weight / pow((height / 100), 2);

  static BMIRange getRange(double bmi) {
    if (bmi >= 25) {
      return bmiRanges['OVERWEIGHT'];
    } else if (bmi > 18.5) {
      return bmiRanges['OK'];
    } else
      return bmiRanges['UNDERWEIGHT'];
  }
}
