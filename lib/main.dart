import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/core/domain/marketplace_settings/settings_bloc.dart';
import 'package:dot_marketplace/core/domain/router/router.dart';
import 'package:dot_marketplace/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(DotMarketplaceApp());
}

class DotMarketplaceApp extends StatelessWidget {
  DotMarketplaceApp({super.key});

  final settingService = SettingsBloc();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: settingService,
      builder: (context, state) => MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: settingService.localeList,
        locale: settingService.curentLocale,
        title: 'Dot Marketplace',
        theme: theme,
      ),
    );
  }
}
