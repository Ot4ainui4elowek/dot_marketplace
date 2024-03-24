import 'package:dot_marketplace/core/presentation/UI/text_fields/app_text_field.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/password_text_editing_controller.dart';
import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final ValueNotifier<bool> _textIsInvisible = ValueNotifier<bool>(true);

  final PassTextEditingController controller;

  void _setPasswordISVisible() =>
      _textIsInvisible.value = !_textIsInvisible.value;

  final String labelText;

  PasswordTextField(
      {super.key, required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _textIsInvisible,
      builder: (context, value, child) => AppTextField(
        controller: controller,
        obscureText: _textIsInvisible.value,
        labelText: labelText,
        prefixIcon: const Padding(
          padding: textFieldIconPadding,
          child: Icon(Icons.lock_outline),
        ),
        suffixIcon: IconButton(
          padding: textFieldIconPadding,
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: _setPasswordISVisible,
        ),
      ),
    );
  }
}
