import 'dart:developer';

import 'package:dot_marketplace/feature/login_page/data/source/auth_mocked_data_source.dart';
import 'package:dot_marketplace/feature/login_page/domain/repository/auth_repository.dart';
import 'package:dot_marketplace/feature/settings/domain/service/settings_service.dart';
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

      repositoryScope = RepositoryScope(authRepository: authRepo);

      final settingsService = SettingsService();

      serviceScope = ServiceScope(settingsService: settingsService);
      return true;
    } catch (e, st) {
      log('App Container has not been initialized', error: e, stackTrace: st);
      return false;
    }
  }
}

class ServiceScope {
  final SettingsService settingsService;

  ServiceScope({
    required this.settingsService,
  });
}

class RepositoryScope {
  final AuthRepository authRepository;

  RepositoryScope({
    required this.authRepository,
  });
}
