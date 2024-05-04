import 'package:dot_marketplace/core/presentation/UI/preloader/preloader.dart';
import 'package:dot_marketplace/feature/splash_screen/presentation/splash_screen_vm.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),
            Image(
              image: logo,
            ),
            const Preloader(),
          ],
        ),
      ),
    );
  }
}
