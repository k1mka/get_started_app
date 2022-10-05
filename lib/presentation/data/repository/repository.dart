import 'package:get_started_app/presentation/models/country_model.dart';

abstract class Repository {
  Future<List<CountryModel>> fetchTrack();
}
