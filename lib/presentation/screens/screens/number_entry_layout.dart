import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_started_app/presentation/screens/screens/bloc/country_bloc.dart';
import 'package:get_started_app/presentation/widgets/custom_button.dart';
import 'package:get_started_app/presentation/widgets/input_form_widget.dart';
import 'package:get_started_app/presentation/widgets/main_text_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'bloc/bloc_events.dart';

class NumberEntryLayout extends StatefulWidget {
  const NumberEntryLayout({Key? key}) : super(key: key);

  @override
  State<NumberEntryLayout> createState() => _NumberEntryLayoutState();
}

class _NumberEntryLayoutState extends State<NumberEntryLayout> {
  @override
  void initState() {
    super.initState();
    context.read<CountryBloc>().add(LoadingCountryEvent());
  }

  void _onButtonPressed() {
    showMaterialModalBottomSheet(
        context: context, builder: (context) => ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8EAAFB),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainTextWidget(),
            Spacer(),
            Row(children: [ ElevatedButton(onPressed: () => _onButtonPressed, child: Text('ам')), InputFormWidget()]),
            Spacer(),
            CustomButton(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
