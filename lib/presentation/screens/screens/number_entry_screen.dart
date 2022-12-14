import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_started_app/presentation/screens/screens/number_entry_layout.dart';

class NumberEntryScreen extends StatelessWidget {
  const NumberEntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NumberEntryLayout();
  }
}
