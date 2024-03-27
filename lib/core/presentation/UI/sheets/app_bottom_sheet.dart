import 'package:dot_marketplace/theme/app_light_colors.dart';
import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget widget;
  const AppBottomSheet({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      showDragHandle: true,
      dragHandleColor: AppLightColors.outline,
      enableDrag: true,
      builder: (context) => widget,
      onClosing: () => 0,
    );
  }
}
