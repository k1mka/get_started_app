import 'package:get_started_app/presentation/models/country_model.dart';

abstract class BlocState {}

class InitialState extends BlocState {}

class LoadingCountry extends BlocState {}

class LoadedCountry extends BlocState {
  final List<CountryModel> countryList;
  LoadedCountry(this.countryList);
}

class ErrorCountry extends BlocState {
  final Object exception;
  ErrorCountry(this.exception);
}
