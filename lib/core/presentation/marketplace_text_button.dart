import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';

class MarketplaceTextButton extends StatelessWidget {
  final String _text;
  final void Function()? onPress;

  const MarketplaceTextButton({super.key, required String text, this.onPress})
      : _text = text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Padding(
        padding: buttonVerticalPadding,
        child: Text(_text),
      ),
    );
  }
}
