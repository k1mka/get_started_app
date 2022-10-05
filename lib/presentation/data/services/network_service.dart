import 'package:get_started_app/presentation/models/country_model.dart';

abstract class NetworkService {
  Future<List<CountryModel>> fetchCountry();
}
