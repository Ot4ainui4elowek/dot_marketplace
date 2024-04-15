import 'dart:developer';

import 'package:dot_marketplace/feature/edit_profile_page/domain/service/advertisement_user_service.dart';
import 'package:dot_marketplace/feature/login_page/data/source/auth_mocked_data_source.dart';
import 'package:dot_marketplace/feature/login_page/domain/repository/auth_repository.dart';
import 'package:dot_marketplace/feature/main_page/data/repository/advertisement_mocked_repository.dart';
import 'package:dot_marketplace/feature/recovery_page/data/source/recovery_mocked_data_source.dart';
import 'package:dot_marketplace/feature/recovery_page/domain/repository/recovery_repository.dart';
import 'package:dot_marketplace/feature/settings/domain/service/locality_settings/settings_service.dart';
import 'package:dot_marketplace/feature/settings/domain/service/theme_settings/theme_service.dart';
import 'package:get_it/get_it.dart';

class AppContainer {
  late final ServiceScope serviceScope;
  late final RepositoryScope repositoryScope;

  AppContainer.init() {
    ready = initDependencies();
    GetIt.instance.registerSingleton(this);
  }

  factory AppContainer() => GetIt.instance<AppContainer>();

  late final Future<bool> ready;

  Future<bool> initDependencies() async {
    try {
      final authRepo = AuthRepository(AuthMockedDataSource());

      final recoveryRepo = RecoveryRepository(RecoveryMockedDataSource());

      final advertisementRepo = AdvertisementMockedRepository();

      repositoryScope = RepositoryScope(
        authRepository: authRepo,
        recoveryRepository: recoveryRepo,
        advertisementRepository: advertisementRepo,
      );

      final settingsService = SettingsService();

      final userService = AdvertisementUserService();

      final themeService = ThemeService();

      serviceScope = ServiceScope(
        settingsService: settingsService,
        userService: userService,
        themeService: themeService,
      );
      return true;
    } catch (e, st) {
      log('App Container has not been initialized', error: e, stackTrace: st);
      return false;
    }
  }
}

class ServiceScope {
  final SettingsService settingsService;

  final AdvertisementUserService userService;

  final ThemeService themeService;

  ServiceScope({
    required this.userService,
    required this.settingsService,
    required this.themeService,
  });
}

class RepositoryScope {
  final AuthRepository authRepository;
  final RecoveryRepository recoveryRepository;
  final AdvertisementMockedRepository advertisementRepository;

  RepositoryScope({
    required this.authRepository,
    required this.recoveryRepository,
    required this.advertisementRepository,
  });
}
