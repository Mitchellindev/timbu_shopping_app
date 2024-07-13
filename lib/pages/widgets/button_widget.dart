import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.label,
      required this.backgroundColor,
      required this.onPressed,
      required this.textColor,
      required this.borderColor});

  final String label;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final Color textColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        elevation: 0,
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(color: borderColor, style: BorderStyle.solid)),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
