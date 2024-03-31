import 'package:dot_marketplace/core/domain/container/app_container.dart';
import 'package:dot_marketplace/core/domain/router/dot_marketplace_routes.dart';
import 'package:dot_marketplace/feature/login_page/presentation/auth_vm.dart';
import 'package:dot_marketplace/feature/login_page/presentation/login_page.dart';
import 'package:dot_marketplace/feature/main_page/presentation/page/advert_page.dart';
import 'package:dot_marketplace/feature/main_page/presentation/page/main_page.dart';
import 'package:dot_marketplace/feature/main_page/presentation/page/main_page_vm.dart';
import 'package:dot_marketplace/feature/recovery_page/presentation/recovery_code_confirm_page.dart';
import 'package:dot_marketplace/feature/recovery_page/presentation/recovery_code_confirm_vm.dart';
import 'package:dot_marketplace/feature/recovery_page/presentation/recovery_new_password_page.dart';
import 'package:dot_marketplace/feature/recovery_page/presentation/recovery_phone_page.dart';
import 'package:dot_marketplace/feature/recovery_page/presentation/recovery_phone_vm.dart';
import 'package:dot_marketplace/feature/splash_screen/presentation/splash_screen_page.dart';
import 'package:dot_marketplace/feature/splash_screen/presentation/splash_screen_vm.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouterConfig {
  static final instance = GoRouter(
    initialLocation: DotMarketplaceRoutes.splashScreen,
    routes: [
      GoRoute(
        path: DotMarketplaceRoutes.splashScreen,
        builder: (context, state) => const SplashScreenPage(
          vm: SpashScreenViewModel(),
        ),
      ),
      GoRoute(
        path: DotMarketplaceRoutes.loginPage,
        builder: (context, state) {
          return LoginPage(
            vm: AuthViewModel(
              authRepository: AppContainer().repositoryScope.authRepository,
              settingService: AppContainer().serviceScope.settingsService,
            ),
          );
        },
      ),
      GoRoute(
          path: DotMarketplaceRoutes.mainPage,
          builder: (context, state) {
            return MainPage(
              vm: MainPageViewModel(
                  advertisementRepository:
                      AppContainer().repositoryScope.advertisementRepository),
            );
          },
          routes: [
            GoRoute(
              path: DotMarketplaceRoutes.advertPage,
              name: DotMarketplaceRoutes.advertPage,
              builder: (context, state) => AdvertPage(),
            )
          ]),
      GoRoute(
          path: DotMarketplaceRoutes.recoverySendingPhonePage,
          builder: (context, state) => RecoveryPhonePage(
                vm: RecoveryPhoneViewModel(
                    recoveryRepository:
                        AppContainer().repositoryScope.recoveryRepository,
                    settingService:
                        AppContainer().serviceScope.settingsService),
              ),
          routes: [
            GoRoute(
              path: DotMarketplaceRoutes.newPasswordPage,
              builder: (context, state) => const RecoveryNewPasswordPage(),
            ),
            GoRoute(
              path: DotMarketplaceRoutes.recoveryCodePage,
              builder: (context, state) => RecoveryCodeConfirm(
                vm: RecoveryCodeConfirmViewModel(
                  recoveryRepository:
                      AppContainer().repositoryScope.recoveryRepository,
                  settingService: AppContainer().serviceScope.settingsService,
                ),
              ),
            ),
          ]),
    ],
  );
}
