import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  final bool textIsInvisible;

  final Widget? prefix;

  final Widget? suffix;

  final String labelText;

  const PasswordTextField(
      {super.key,
      required this.controller,
      required this.textIsInvisible,
      this.prefix,
      this.suffix,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: textIsInvisible,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        labelText: labelText,
      ),
    );
  }
}
