import 'package:flutter/material.dart';

typedef ValidatorFunction = String? Function(String?);

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    Key? key,
    required this.labelText,
    this.validator,
  }) : super(key: key);

  final String labelText;
  final ValidatorFunction? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: labelText,
      ),
      validator: validator,
    );
  }
}
