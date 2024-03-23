import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String _text;
  final void Function()? onPressed;

  const AppTextButton({super.key, required String text, this.onPressed})
      : _text = text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        _text,
      ),
    );
  }
}
