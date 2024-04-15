import 'package:dot_marketplace/core/domain/container/app_container.dart';
import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/core/presentation/UI/sheets/app_bottom_sheet.dart';
import 'package:dot_marketplace/feature/settings/domain/entity/app_locale.dart';
import 'package:dot_marketplace/feature/settings/domain/service/locality_settings/settings_service.dart';
import 'package:dot_marketplace/feature/settings/domain/service/theme_settings/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsModalBottomSheet extends StatelessWidget {
  final SettingsService settingsService =
      AppContainer().serviceScope.settingsService;
  final ThemeService themeService = AppContainer().serviceScope.themeService;

  SettingsModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).settings,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  child: Text(S.of(context).ready),
                  onPressed: () => context.pop(),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownMenu(
                    controller: TextEditingController(
                        text: settingsService.curentLocale.name),
                    label: Text(S.of(context).appLanguage),
                    onSelected: (AppLocale? value) {
                      if (value != null) {
                        settingsService.add(ChangeLocaleEvent(value));
                      }
                    },
                    expandedInsets: EdgeInsets.zero,
                    dropdownMenuEntries: settingsService.localeList
                        .map((e) => DropdownMenuEntry(value: e, label: e.name))
                        .toList()),
                const SizedBox(height: 24),
                const Divider(height: 1),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).theme,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    BlocBuilder(
                      bloc: themeService,
                      builder: (context, state) => state is ThemeInitial
                          ? Switch(
                              value: state.themeIsDark,
                              onChanged: (value) {
                                themeService.add(SwitchThemeEvent());
                                value = state.themeIsDark;
                              })
                          : const SizedBox(height: 0),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
