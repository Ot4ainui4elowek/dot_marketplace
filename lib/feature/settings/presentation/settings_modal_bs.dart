import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/core/presentation/UI/sheets/app_bottom_sheet.dart';
import 'package:dot_marketplace/feature/settings/domain/entity/app_locale.dart';
import 'package:dot_marketplace/feature/settings/domain/service/settings_service.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsModalBottomSheet extends StatelessWidget {
  final SettingsService settingsService;

  SettingsModalBottomSheet({super.key, required this.settingsService});

  final ValueNotifier<bool> lightTheme = ValueNotifier<bool>(false);

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
                AppElevatedButton(
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
                    ValueListenableBuilder(
                      valueListenable: lightTheme,
                      builder: (context, value, child) => Switch(
                          value: lightTheme.value,
                          onChanged: (value) {
                            value = lightTheme.value = !lightTheme.value;
                          }),
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
