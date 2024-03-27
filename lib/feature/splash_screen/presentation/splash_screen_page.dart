import 'package:dot_marketplace/feature/splash_screen/presentation/splash_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreenPage extends StatefulWidget {
  final SpashScreenViewModel vm;
  const SplashScreenPage({super.key, required this.vm});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final AssetImage logo = const AssetImage('assets/image/logo.png');

  @override
  void initState() {
    super.initState();
    widget.vm.goToAuth(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),
            Image(
              image: logo,
            ),
            LoadingAnimationWidget.discreteCircle(
              color: theme.colorScheme.primary,
              secondRingColor: theme.colorScheme.secondary,
              thirdRingColor: Colors.transparent,
              size: 45,
            ),
          ],
        ),
      ),
    );
  }
}
