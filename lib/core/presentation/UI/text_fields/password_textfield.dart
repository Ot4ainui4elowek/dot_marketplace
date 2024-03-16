import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  final ValueNotifier<bool> _textIsInvisible = ValueNotifier<bool>(true);

  void _setPasswordISVisible() =>
      _textIsInvisible.value = !_textIsInvisible.value;

  final String labelText;

  PasswordTextField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _textIsInvisible,
      builder: (context, value, child) => TextField(
        controller: controller,
        obscureText: _textIsInvisible.value,
        decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: textFieldIconPadding,
            child: Icon(Icons.lock_outline),
          ),
          suffixIcon: IconButton(
            padding: textFieldIconPadding,
            icon: const Icon(Icons.remove_red_eye_outlined),
            onPressed: _setPasswordISVisible,
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
