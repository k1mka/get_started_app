import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;
  double minimalSize = 40;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.next_plan_outlined,
          size: minimalSize,
        ));
  }
}
