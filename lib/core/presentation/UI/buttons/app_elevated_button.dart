import 'dart:async';

import 'package:dot_marketplace/theme/app_light_colors.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatefulWidget {
  final Widget? child;
  final FutureOr<void> Function()? onPressed;

  final double? width;

  const AppElevatedButton({
    super.key,
    this.onPressed,
    this.child,
    this.width,
  });

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends State<AppElevatedButton> {
  bool _isLoading = false;

  final _buttonGlobalKey = GlobalKey();

  double? _buttonHeight;

  Future<void> _onPressed() async {
    if (_isLoading) return;
    try {
      setState(() => _isLoading = true);

      await widget.onPressed?.call();
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _buttonHeight = _buttonGlobalKey.currentContext?.size?.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _buttonGlobalKey,
      width: widget.width ?? double.maxFinite,
      height: _buttonHeight,
      child: ElevatedButton(
        onPressed: widget.onPressed != null ? _onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          disabledBackgroundColor: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: !_isLoading
              ? widget.child
              : SizedBox(
                  width: _buttonHeight! - 36.0,
                  child: const CircularProgressIndicator.adaptive(
                    backgroundColor: AppLightColors.background,
                  ),
                ),
        ),
      ),
    );
  }
}
