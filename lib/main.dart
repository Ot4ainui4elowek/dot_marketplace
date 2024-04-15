import 'package:dot_marketplace/core/domain/container/app_container.dart';
import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/feature/settings/domain/service/locality_settings/settings_service.dart';
import 'package:dot_marketplace/core/domain/router/router.dart';
import 'package:dot_marketplace/feature/settings/domain/service/theme_settings/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(DotMarketplaceApp(
    appContainer: AppContainer.init(),
  ));
}

class DotMarketplaceApp extends StatelessWidget {
  final AppContainer appContainer;

  const DotMarketplaceApp({
    super.key,
    required this.appContainer,
  });
  ThemeService get themeService => appContainer.serviceScope.themeService;

  SettingsService get settingsService =>
      appContainer.serviceScope.settingsService;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: settingsService,
      builder: (context, state) => BlocBuilder(
        bloc: themeService,
        builder: (context, state) => MaterialApp.router(
          routerConfig: AppRouterConfig.instance,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: settingsService.localeList,
          locale: settingsService.curentLocale,
          title: 'Dot Marketplace',
          theme: themeService.state.theme,
        ),
      ),
    );
  }
}
