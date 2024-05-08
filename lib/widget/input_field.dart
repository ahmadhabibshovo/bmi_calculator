import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
  super.key,
  required, required this.label, required this.onSave
});
final String label;
final Function(String?) onSave;
@override
Widget build(BuildContext context) {
  return SizedBox(
    height: 90,
    width: 100,
    child: TextFormField(
      validator: (value){
        if (value == null || value.trim().isEmpty){
          return "Please insert valid input";
        }
      },
      onSaved: onSave,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(label: Text(label)),
    ),
  );
}
}