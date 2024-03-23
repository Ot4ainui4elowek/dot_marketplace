import 'package:dot_marketplace/core/domain/router/dot_marketplace_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpashScreenViewModel {
  const SpashScreenViewModel();

  Future<void> goToAuth(BuildContext context) => Future.delayed(
      const Duration(seconds: 2),
      () => context.go(DotMarketplaceRoutes.loginPage));
}
