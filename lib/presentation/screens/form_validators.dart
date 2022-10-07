import 'package:get_started_app/presentation/widgets/input_field_widget.dart';

class FormValidators {
  static ValidatorFunction numberValidator = (value) {
    if (value == null || value.isEmpty) return 'Please, enter phone number';
    if (value.length < 15) return 'Please, enter correct phone number';
    return null;
  };
}
