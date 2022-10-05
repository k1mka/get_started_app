import 'package:get_started_app/presentation/data/repository/repository.dart';
import 'package:get_started_app/presentation/data/services/network_service.dart';
import 'package:get_started_app/presentation/models/country_model.dart';

class RepositoryImpl extends Repository {
  RepositoryImpl(this.networkService);

  final NetworkService networkService;

  @override
  Future<List<CountryModel>> fetchTrack() => networkService.fetchCountry();
}
