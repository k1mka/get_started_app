import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.onPressed, required this.enabled}) : super(key: key);

  final VoidCallback onPressed;
  static const double minimalSize = 20;

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: enabled ? Colors.white : const Color.fromRGBO(244, 245, 255, 0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: enabled ? onPressed : null,
      child: Icon(
        color: enabled ? Colors.black : Colors.white,
        Icons.arrow_forward,
        size: minimalSize,
      ),
    );
  }
}
