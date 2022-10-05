import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_started_app/presentation/screens/form_validators.dart';
import 'package:get_started_app/presentation/widgets/input_field_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class InputFormWidget extends StatefulWidget {
  const InputFormWidget({Key? key}) : super(key: key);

  @override
  State<InputFormWidget> createState() => _MyLogFormWidgetState();
}

class _MyLogFormWidgetState extends State<InputFormWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: InputFieldWidget(
              labelText: '(123) 123-1234',
              validator: FormValidators.numberValidator,
            ),
          )
        ],
      ),
    );
  }
}
