import 'package:flutter/material.dart';
import 'package:get_started_app/presentation/models/country_model.dart';

class CountryWidget extends StatelessWidget {
  const CountryWidget({Key? key, required this.countryModel}) : super(key: key);

  final CountryModel countryModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(countryModel.flag),
        Text(countryModel.phoneID),
        Text(countryModel.region),
      ],
    );
  }
}
