import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_started_app/presentation/models/country_model.dart';
import 'package:get_started_app/presentation/screens/form_validators.dart';
import 'package:get_started_app/presentation/widgets/input_field_widget.dart';

class InputFormWidget extends StatefulWidget {
  const InputFormWidget({Key? key, required this.onTap, required this.onValidationChanged}) : super(key: key);

  final Future<CountryModel?> Function() onTap;
  final void Function(bool) onValidationChanged;

  @override
  State<InputFormWidget> createState() => _MyLogFormWidgetState();
}

class _MyLogFormWidgetState extends State<InputFormWidget> {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final fullPhoneNode = FocusNode();

  bool isFullPhoneFieldValid = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: InkWell(
                onTap: () async {
                  final country = await widget.onTap();
                  String code = '';
                  if (country == null) {
                    FocusManager().primaryFocus?.unfocus();
                  } else {
                    code = country.flagAndCode;
                    fullPhoneNode.requestFocus();
                  }
                  textController.text = code;
                },
                child: TextFormField(
                  enabled: false,
                  controller: textController,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              flex: 7,
              child: InputFieldWidget(
                labelText: '(123) 123-1234',
                onFieldSubmitted: (_) => formKey.currentState?.validate(),
                validator: (input) {
                  final error = FormValidators.numberValidator(input);
                  final isValid = error == null;
                  if (isFullPhoneFieldValid != isValid) {
                    isFullPhoneFieldValid = isValid;
                    widget.onValidationChanged(isFullPhoneFieldValid);
                  }

                  return error;
                },
                node: fullPhoneNode,
                inputFormatters: <TextInputFormatter>[
                  InternationalPhoneFormatter(),
                ],
              ),
            ),
          ],
        ));
  }
}

// todo: move to another file
class InternationalPhoneFormatter extends TextInputFormatter {
  String internationalPhoneFormat(value) {
    String nums = value.replaceAll(RegExp(r'[\D]'), '');
    String internationalPhoneFormatted = nums.substring(0, nums.isNotEmpty ? 0 : null) +
        (nums.isNotEmpty ? ' (' : '') +
        nums.substring(0, nums.length >= 3 ? 3 : null) +
        (nums.length > 3 ? ') ' : '') +
        (nums.length > 3
            ? nums.substring(3, nums.length >= 6 ? 6 : null) +
                (nums.length > 6 ? ' ${nums.substring(6, nums.length >= 10 ? 10 : null)}' : '')
            : '');
    return internationalPhoneFormatted;
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    return newValue.copyWith(
        text: internationalPhoneFormat(text),
        selection: TextSelection.collapsed(offset: internationalPhoneFormat(text).length));
  }
}
