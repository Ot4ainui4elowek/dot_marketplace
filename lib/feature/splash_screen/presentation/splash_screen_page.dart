import 'package:dot_marketplace/feature/router/domain/dot_marketplace_routes.dart';
import 'package:dot_marketplace/feature/router/domain/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    Future.delayed(const Duration(seconds: 4),
        () => Navigator.of(context).pushNamed(DotMarketplaceRoutes.loginPage));
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
