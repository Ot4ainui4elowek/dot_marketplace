import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Preloader extends StatelessWidget {
  const Preloader({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.discreteCircle(
      color: Theme.of(context).colorScheme.primary,
      secondRingColor: Colors.transparent,
      thirdRingColor: Colors.transparent,
      size: 45,
    );
  }
}
