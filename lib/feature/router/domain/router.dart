import 'package:dot_marketplace/feature/login_page/presentation/login_page.dart';
import 'package:dot_marketplace/feature/router/domain/dot_marketplace_routes.dart';
import 'package:dot_marketplace/feature/splash_screen/presentation/splash_screen_page.dart';

final router = {
  DotMarketplaceRoutes.splashScreen: (context) => const SplashScreenPage(),
  DotMarketplaceRoutes.loginPage: (context) => const LoginPage(),
};
