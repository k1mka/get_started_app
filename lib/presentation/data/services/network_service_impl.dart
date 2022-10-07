import 'dart:convert';

import 'package:get_started_app/presentation/models/country_model.dart';
import 'package:http/http.dart';

import 'network_service.dart';

class NetworkServiceImpl extends NetworkService {
  @override
  Future<List<CountryModel>> fetchCountry() async {
    final url = Uri.parse('https://restcountries.com/v3.1/all');
    final response = await get(url);
    final List responseListCountry = jsonDecode(response.body);
    final result = <CountryModel>[];
    for (var map in responseListCountry) {
      final String region = map['name']['common'] ?? 'null';
      final String flag = map['flag'] ?? 'null';
      final String phoneID = map['idd']['root'] ?? 'null';
      final List phoneSuffixes = map['idd']['suffixes'] ?? [];

      for (var suffix in phoneSuffixes) {
        result.add(
          region.isFoolCountry
              ? CountryModel(region: 'Fool country', flag: '💩', phoneID: phoneID, phoneSuffix: suffix)
              : CountryModel(region: region, flag: flag, phoneID: phoneID, phoneSuffix: suffix),
        );
      }
    }

    return result;
  }
}

extension FoolCountry on String {
  static const foolCountyName = 'Russia';
  bool get isFoolCountry => this == foolCountyName;
}
