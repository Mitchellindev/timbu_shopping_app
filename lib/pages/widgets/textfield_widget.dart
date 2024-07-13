import 'package:flutter/material.dart';
import 'package:task_3/core/constants/app_color.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String? hintText;
  final String? label;

  const MyTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    this.hintText,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
          color: AppColors.borderColor,
          width: 1.0,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignInside),
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label *',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            fillColor: AppColors.white,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.borderColor,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
            focusedBorder: border,
            enabledBorder: border,
            filled: true,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
