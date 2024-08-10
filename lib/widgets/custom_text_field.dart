import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  // Constructor with `Key? key` as a super parameter
  const CustomTextField({
    Key? key,
    this.controller,
    required this.label,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: validator,
    );
  }
}
