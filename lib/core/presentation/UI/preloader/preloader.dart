import 'package:dot_marketplace/theme/app_light_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Preloader extends StatelessWidget {
  const Preloader({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.discreteCircle(
      color: AppLightColors.primary,
      secondRingColor: Colors.transparent,
      thirdRingColor: Colors.transparent,
      size: 45,
    );
  }
}
