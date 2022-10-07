import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_started_app/presentation/data/services/network_service_impl.dart';
import 'package:get_started_app/presentation/models/country_model.dart';
import 'package:get_started_app/presentation/screens/screens/choose_country_screen.dart';
import 'package:get_started_app/presentation/widgets/custom_button.dart';
import 'package:get_started_app/presentation/widgets/input_form_widget.dart';
import 'package:get_started_app/presentation/widgets/main_text_widget.dart';

class NumberEntryLayout extends StatefulWidget {
  const NumberEntryLayout({Key? key}) : super(key: key);

  @override
  State<NumberEntryLayout> createState() => _NumberEntryLayoutState();
}

class _NumberEntryLayoutState extends State<NumberEntryLayout> {
  bool isButtonEnabled = false;

  Future<CountryModel?> _onButtonPressed() async => showModalBottomSheet<CountryModel?>(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        isScrollControlled: true,
        context: context,
        backgroundColor: const Color(0xFF8EAAFB),
        builder: (context) => DraggableScrollableSheet(
          expand: false,
          minChildSize: 0.32,
          initialChildSize: 0.9,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) => const ChooseCountryScreen(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8EAAFB),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainTextWidget(),
            const Spacer(),
            InputFormWidget(
                onTap: _onButtonPressed,
                onValidationChanged: (isValid) {
                  setState(() => isButtonEnabled = isValid);
                }),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomButton(
                onPressed: () {},
                enabled: isButtonEnabled,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
