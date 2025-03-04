import 'package:bmi_calculator/config/theme_data.dart';
import 'package:bmi_calculator/screens/bmi_calculator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: DynamicTheme.light,
      darkTheme: DynamicTheme.dark,
      home: const BMICalculator(),
    );
  }
}
