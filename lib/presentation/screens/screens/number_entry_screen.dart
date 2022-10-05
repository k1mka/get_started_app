import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_started_app/get_it.dart';
import 'package:get_started_app/presentation/data/repository/repository.dart';
import 'package:get_started_app/presentation/screens/screens/bloc/country_bloc.dart';
import 'package:get_started_app/presentation/screens/screens/number_entry_layout.dart';

class NumberEntryScreen extends StatelessWidget {
  const NumberEntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryBloc>(
      create: (_) => CountryBloc(getIt<Repository>()),
      child: const NumberEntryLayout(),
    );
  }
}
