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
      decoration: InputDecoration(
        labelText: labelText,
      ),
      validator: validator,
    );
  }
}
