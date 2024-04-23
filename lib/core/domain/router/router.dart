import 'package:dot_marketplace/core/domain/container/app_container.dart';
import 'package:dot_marketplace/core/domain/router/dot_marketplace_routes.dart';
import 'package:dot_marketplace/feature/advert_page/presentation/advert_page.dart';
import 'package:dot_marketplace/feature/create_advert_page/presentation/create_advert_page.dart';
import 'package:dot_marketplace/feature/edit_profile_page/presentation/advertisement_edit_profile_page.dart';
import 'package:dot_marketplace/feature/edit_profile_page/presentation/advertisement_edit_profile_page_vm.dart';
import 'package:dot_marketplace/feature/login_page/presentation/auth_vm.dart';
import 'package:dot_marketplace/feature/login_page/presentation/login_page.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/adverisement_list_item.dart';
import 'package:dot_marketplace/feature/main_page/presentation/page/favorite_page/advertisement_favorite_page.dart';
import 'package:dot_marketplace/feature/main_page/presentation/page/favorite_page/advertisement_favorite_page_vm.dart';
import 'package:dot_marketplace/feature/main_page/presentation/page/advertisement_page/advertisement_page_vm.dart';
import 'package:dot_marketplace/feature/main_page/presentation/page/advertisement_page/advertisement_page.dart';
import 'package:dot_marketplace/feature/main_page/presentation/page/main_page/main_page.dart';
import 'package:dot_marketplace/feature/main_page/presentation/page/profile_page/advertisement_profile_page.dart';
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
              ),
            );
          },
          routes: [
            GoRoute(
                path: DotMarketplaceRoutes.recoverySendingPhonePage,
                builder: (context, state) => RecoveryPhonePage(
                      vm: RecoveryPhoneViewModel(
                        recoveryRepository:
                            AppContainer().repositoryScope.recoveryRepository,
                      ),
                    ),
                routes: [
                  GoRoute(
                    path: DotMarketplaceRoutes.newPasswordPage,
                    builder: (context, state) =>
                        const RecoveryNewPasswordPage(),
                  ),
                  GoRoute(
                    path: DotMarketplaceRoutes.recoveryCodePage,
                    builder: (context, state) {
                      final data = state.extra! as String;
                      return RecoveryCodeConfirm(
                        number: data,
                        vm: RecoveryCodeConfirmViewModel(
                          recoveryRepository:
                              AppContainer().repositoryScope.recoveryRepository,
                          settingService:
                              AppContainer().serviceScope.settingsService,
                        ),
                      );
                    },
                  ),
                ]),
          ]),
      GoRoute(
        path: DotMarketplaceRoutes.advertPage,
        name: DotMarketplaceRoutes.advertPage,
        builder: (context, state) {
          final data = state.extra! as AdvertisementListItem;
          return AdvertPage(
            advertisementListItem: data,
          );
        },
      ),
      GoRoute(
        path: DotMarketplaceRoutes.editProfilePage,
        name: DotMarketplaceRoutes.editProfilePage,
        builder: (context, state) => AdvertisementEditProfilePage(
          vm: AadvertisementEditProfilePageViewModel(
              service: AppContainer().serviceScope.userService),
        ),
      ),
      GoRoute(
        path: DotMarketplaceRoutes.createAdvert,
        name: DotMarketplaceRoutes.createAdvert,
        builder: (context, state) => CreateAdvertPage(),
      ),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => MainPage(
                navigationShell: navigationShell,
              ),
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: DotMarketplaceRoutes.advertisementPage,
                  builder: (context, state) => AdvertisementPage(
                    vm: AdvertisementPageViewModel(
                      advertisementRepository: AppContainer()
                          .repositoryScope
                          .advertisementRepository,
                    ),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: DotMarketplaceRoutes.advertisementFavoritePage,
                  builder: (context, state) => AdvertisementFavoritePage(
                      vm: AdvertisementFavotitePageViewModel(
                          advertisementRepository: AppContainer()
                              .repositoryScope
                              .advertisementRepository)),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: DotMarketplaceRoutes.profilePage,
                  builder: (context, state) {
                    return AdvertisementProfilePage(
                      service: AppContainer().serviceScope.userService,
                    );
                  },
                ),
              ],
            ),
          ]),
    ],
  );
}
