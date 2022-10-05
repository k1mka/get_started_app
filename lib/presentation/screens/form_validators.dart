import 'package:get_started_app/presentation/widgets/input_field_widget.dart';

class FormValidators {
  static final _emailRegexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}');
  // TODO: CHANGE VALIDATION

  static ValidatorFunction numberValidator = (value) {
    if (value == null || value.isEmpty) return 'Please, enter phone number';
    if (!_emailRegexp.hasMatch(value)) return 'Please, enter correct phone number';
    return null;
  };
}
