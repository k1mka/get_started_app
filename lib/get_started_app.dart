import 'package:flutter/material.dart';

import 'presentation/screens/screens/number_entry_screen.dart';

class GetStartedApp extends StatefulWidget {
  const GetStartedApp({Key? key}) : super(key: key);

  @override
  State<GetStartedApp> createState() => _GetStartedAppState();
}

class _GetStartedAppState extends State<GetStartedApp> {
  final focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(),
  );

  final focusedErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.red),
  );

  final unFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide.none,
  );

  final disabledBorder = OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none);

  final errorBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF292D32),
        focusColor: const Color(0xFF292D32),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: focusedBorder,
          focusedErrorBorder: focusedErrorBorder,
          enabledBorder: unFocusedBorder,
          disabledBorder: disabledBorder,
          border: unFocusedBorder,
          errorBorder: errorBorder,
          filled: true,
          fillColor: const Color.fromRGBO(244, 245, 255, 0.4),
          labelStyle: const TextStyle(
            color: Color(0xFF7886B8),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFF292D32),
        ),
      ),
      home: const SafeArea(
        child: NumberEntryScreen(),
      ),
    );
  }
}
