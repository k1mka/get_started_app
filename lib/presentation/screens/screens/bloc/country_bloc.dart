import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_started_app/presentation/data/repository/repository.dart';
import 'package:get_started_app/presentation/screens/screens/bloc/bloc_states.dart';

import 'bloc_events.dart';

class CountryBloc extends Bloc<BlocEvent, BlocState> {
  Repository repository;
  CountryBloc(this.repository) : super(InitialState()) {
    on<LoadingCountryEvent>((event, emit) async {
      emit(LoadingCountry());
      emit(LoadedCountry(await repository.fetchTrack()));
    });
  }
}
