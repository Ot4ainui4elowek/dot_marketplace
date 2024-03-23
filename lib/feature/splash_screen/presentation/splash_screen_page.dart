import 'package:dot_marketplace/core/domain/router/dot_marketplace_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final AssetImage logo = const AssetImage('assets/image/logo.png');

  @override
  void initState() {
    super.initState;
    Future.delayed(const Duration(seconds: 4),
        () => context.go(DotMarketplaceRoutes.loginPage));
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
