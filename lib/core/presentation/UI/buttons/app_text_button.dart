import 'package:dot_marketplace/theme/styles.dart';
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
      child: Padding(
        padding: verticalPadding10,
        child: Text(
          _text,
        ),
      ),
    );
  }
}
