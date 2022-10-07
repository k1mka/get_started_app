import 'package:flutter/material.dart';

class ChooseTextWidget extends StatelessWidget {
  const ChooseTextWidget({Key? key}) : super(key: key);

  final mainText = 'Country code';
  final sizeMainText = 40.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        mainText,
        style: TextStyle(fontSize: sizeMainText, color: Colors.white),
      ),
    );
  }
}
