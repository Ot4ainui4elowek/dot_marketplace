import 'package:flutter/material.dart';

class MarketplaceTextField extends StatelessWidget {
  final controller;

  bool textIsInvisible;

  final Widget? prefix;

  final Widget? suffix;

  final String labelText;

  MarketplaceTextField(
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
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
