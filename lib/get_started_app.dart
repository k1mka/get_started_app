import 'package:flutter/material.dart';

import 'presentation/screens/number_entry_screen.dart';

class GetStartedApp extends StatelessWidget {
  const GetStartedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(child: NumberEntryScreen()),
    );
  }
}
