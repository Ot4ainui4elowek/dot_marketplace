import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';

class AppFilledButton extends StatelessWidget {
  final Widget _widget;
  final void Function()? onPressed;

  const AppFilledButton({super.key, required Widget widget, this.onPressed})
      : _widget = widget;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Padding(
        padding: verticalPadding10,
        child: _widget,
      ),
    );
  }
}
