import 'package:flutter/material.dart';
import 'package:get_started_app/presentation/widgets/main_text_widget.dart';

class NumberEntryLayout extends StatefulWidget {
  const NumberEntryLayout({Key? key}) : super(key: key);

  @override
  State<NumberEntryLayout> createState() => _NumberEntryLayoutState();
}

class _NumberEntryLayoutState extends State<NumberEntryLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8EAAFB),
      body: Column(
        children: const [
          SizedBox(height: 80),
          MainTextWidget(),
        ],
      ),
    );
  }
}
