import 'package:flutter/material.dart';

const List<String> bmiClassifications = [
  'Very Severely Underweight',
  'Severely Underweight',
  'Underweight',
  'Normal',
  'Overweight',
  'Obese Class I',
  'Obese Class II',
  'Obese Class III',
];
List<String> numberRanges = [
  ' <- 15.9',
  '16.0 - 16.9',
  '17.0 - 18.4',
  '18.5 - 24.9',
  '25.0 - 29.9',
  '30.0 - 34.9',
  '35.0 - 39.9',
  ' >= 45.0',
];

class Range {
  final double min;
  final double max;

  const Range(this.min, this.max);
}

List<Range> ranges = const [
  Range(0.1, 15.9),
  Range(16, 16.9),
  Range(17.0, 18.4),
  Range(18.5, 24.9),
  Range(25.0, 29.9),
  Range(30.0, 34.9),
  Range(35.0, 39.9),
  Range(45.0, double.infinity),
];

Color bmiColor(double bmi) {
  if (bmi > 0 && bmi < 18.5) {
    return Colors.orangeAccent;
  } else if (bmi > 18.4 && bmi < 25) {
    return Colors.green;
  } else if (bmi > 24.5) {
    return Colors.red;
  }
  return Colors.black;
}

Color rangeColor(String rangeString, double bmi) {
  double range = double.parse(rangeString.substring(rangeString.length - 4));
  if (bmi > 0 && range < 18.5) {
    return Colors.orangeAccent;
  } else if (bmi > 0 && range > 18.4 && range < 25) {
    return Colors.green;
  } else if (bmi > 0 && range > 24.5) {
    return Colors.red;
  }
  return Colors.black;
}

String bmiText(double bmi) {
  if (bmi < 18.5) {
    return "Your BMI is Underweight";
  } else if (bmi > 18.4 && bmi < 25) {
    return 'Your BMI is Normal';
  } else if (bmi > 24.5) {
    return 'Your BMI is Overweight';
  }
  return '';
}
