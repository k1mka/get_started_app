import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef ValidatorFunction = String? Function(String?);

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    super.key,
    required this.labelText,
    this.validator,
    this.node,
    this.inputFormatters,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
  });

  final String labelText;
  final ValidatorFunction? validator;
  final FocusNode? node;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      focusNode: node,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        labelText: labelText,
      ),
      validator: validator,
    );
  }
}
