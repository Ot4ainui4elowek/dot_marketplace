import 'package:dot_marketplace/feature/router/domain/dot_marketplace_routes.dart';
import 'package:dot_marketplace/feature/router/domain/router.dart';
import 'package:dot_marketplace/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DotMarketplaceApp());
}

class DotMarketplaceApp extends StatelessWidget {
  const DotMarketplaceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dot Marketplace',
      theme: theme,
      routes: router,
      initialRoute: DotMarketplaceRoutes.splashScreen,
    );
  }
}
