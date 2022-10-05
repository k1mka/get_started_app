import 'package:flutter/material.dart';

class MainTextWidget extends StatelessWidget {
  const MainTextWidget({Key? key}) : super(key: key);

  final mainText = 'Get Started';
  final sizeMainText = 40.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        mainText,
        style: TextStyle(fontSize: sizeMainText, color: Colors.white),
      ),
    );
  }
}
