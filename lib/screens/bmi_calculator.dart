import 'package:bmi_calculator/constant/constant.dart';
import 'package:bmi_calculator/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final formKey = GlobalKey<FormState>();
  int weight = 0;
  double heightInc = 0;
  int heightFoot = 0;
  double age = 0;
  double bmi = 0;
  bool selected1 = false;
  bool selected2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Calculator"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BMICalculator()));
            },
            icon: const Icon(Icons.restart_alt),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InputField(
                          label: "Age",
                          onSave: (value) {
                            age = double.parse(value!);
                          }),
                      InputField(
                          label: "Height(f)",
                          onSave: (value) {
                            heightFoot = int.parse(value!);
                          }),
                      InputField(
                          label: "Height(in)",
                          onSave: (value) {
                            heightInc = double.parse(value!);
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (selected2) {
                                  selected1 = true;
                                  selected2 = false;
                                } else {
                                  selected1 = true;
                                  selected2 = false;
                                }

                                setState(() {});
                              },
                              icon: Icon(Icons.male,
                                  size: 45,
                                  color: selected1
                                      ? Colors.blueAccent
                                      : Colors.black)),
                          const Text(
                            "|",
                            style: TextStyle(fontSize: 40),
                          ),
                          IconButton(
                              onPressed: () {
                                if (selected1) {
                                  selected2 = true;
                                  selected1 = false;
                                } else {
                                  selected2 = true;
                                  selected1 = false;
                                }
                                setState(() {});
                              },
                              icon: Icon(Icons.female,
                                  size: 45,
                                  color: selected2
                                      ? Colors.purpleAccent
                                      : Colors.black)),
                        ],
                      ),
                      InputField(
                          label: "Weight(KG)",
                          onSave: (value) {
                            weight = int.parse(value!);
                          }),
                      IconButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                            } else {
                              return;
                            }
                            bmi = weight /
                                (((heightFoot * 12 + heightInc) * 0.0254) *
                                    ((heightFoot * 12 + heightInc) * 0.0254));
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.done_outline_outlined,
                            size: 45,
                            color: Colors.green,
                          ))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 10,
                    maximum: 40,
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0,
                          endValue: 18.4,
                          color: Colors.orangeAccent),
                      GaugeRange(
                          startValue: 18.5,
                          endValue: 24.9,
                          color: Colors.green),
                      GaugeRange(
                          startValue: 25, endValue: 40, color: Colors.red)
                    ],
                    pointers: <GaugePointer>[NeedlePointer(value: bmi)],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Container(
                              child: Text(bmi.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: bmiColor(bmi)))),
                          angle: 90,
                          positionFactor: 0.5)
                    ],
                  ),
                ],
              ),
            ),
            for (int i = 0; i < 8; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      bmiClassifications[i],
                      style: TextStyle(
                          color: ranges[i].min <= bmi && ranges[i].max >= bmi
                              ? rangeColor(numberRanges[i], bmi)
                              : Colors.black,
                          fontWeight:
                              ranges[i].min <= bmi && ranges[i].max >= bmi
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                          fontSize: 16),
                    ),
                    Text(
                      numberRanges[i],
                      style: TextStyle(
                          color: ranges[i].min <= bmi && ranges[i].max >= bmi
                              ? rangeColor(numberRanges[i], bmi)
                              : Colors.black,
                          fontWeight:
                              ranges[i].min <= bmi && ranges[i].max >= bmi
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: bmi > 0
                  ? Text(
                      bmiText(bmi),
                      style: TextStyle(
                          color: bmiColor(bmi),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  : const Text(
                      'Check Your BMI',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
