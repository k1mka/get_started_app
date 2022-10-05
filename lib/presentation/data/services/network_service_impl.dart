import 'dart:convert';

import 'package:get_started_app/presentation/models/country_model.dart';
import 'package:http/http.dart';

import 'network_service.dart';

class NetworkServiceImpl extends NetworkService {
  @override
  Future<List<CountryModel>> fetchCountry() async {
    final url = Uri.parse('https://api.spotify.com/v1/tracks/6rqhFgbbKwnb9MLmUQDhG6');
    final response = await get(url);
    Future<List> responseListCountry = json.decode(response.body);
    print(responseListCountry.toString());
    throw Exception();
  }
}
