import 'package:dot_marketplace/feature/login_page/presentation/login_page.dart';
import 'package:dot_marketplace/feature/router/domain/dot_marketplace_routes.dart';
import 'package:dot_marketplace/feature/splash_screen/presentation/splash_screen_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: DotMarketplaceRoutes.splashScreen,
  routes: [
    GoRoute(
      path: DotMarketplaceRoutes.splashScreen,
      builder: (context, state) => const SplashScreenPage(),
    ),
    GoRoute(
      path: DotMarketplaceRoutes.loginPage,
      builder: (context, state) => const LoginPage(),
    )
  ],
);
