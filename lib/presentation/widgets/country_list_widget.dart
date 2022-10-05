import 'package:flutter/material.dart';
import 'package:get_started_app/presentation/models/country_model.dart';
import 'package:get_started_app/presentation/widgets/country_widget.dart';

class CountryListWidget extends StatelessWidget {
  const CountryListWidget({Key? key, required this.countryList}) : super(key: key);

  final List<CountryModel> countryList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: countryList.length,
      itemBuilder: (_, i) => CountryWidget(
        countryModel: countryList[i],
      ),
    );
  }
}
