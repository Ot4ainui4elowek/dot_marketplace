import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/core/domain/marketplace_settings/settings_bloc.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_text_button.dart';
import 'package:dot_marketplace/feature/login_page/presentation/authorization_widget.dart';
import 'package:dot_marketplace/feature/login_page/presentation/registration_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final settingService = SettingsBloc();
  final ValueNotifier<bool> lightTheme = ValueNotifier<bool>(false);
  Widget get localizationBottomSheet => BottomSheet(
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.of(context).settings),
                  AppTextButton(
                    text: S.of(context).ready,
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
                          text: settingService.curentLocale.name),
                      label: Text(S.of(context).appLanguage),
                      onSelected: (value) {
                        if (value != null) {
                          settingService.add(EChangeLocale(value));
                        }
                      },
                      expandedInsets: EdgeInsets.zero,
                      dropdownMenuEntries: settingService.localeList
                          .map(
                              (e) => DropdownMenuEntry(value: e, label: e.name))
                          .toList()),
                  const SizedBox(height: 24),
                  const Divider(height: 1),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).theme),
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
        onClosing: () => 0,
      );

  List<Widget> get _tabHeaders => <Widget>[
        Tab(
          text: S.of(context).login,
        ),
        Tab(
          text: S.of(context).registration,
        ),
      ];

  List<Widget> get _tabWidgets => <Widget>[
        const AuthorizationWidget(),
        const RegistrationWidget(),
      ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(
            onPressed: () => context.pop(),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.translate,
              ),
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => localizationBottomSheet,
              ),
            ),
          ],
          bottom: TabBar(
            tabs: _tabHeaders,
          ),
        ),
        body: TabBarView(
          clipBehavior: Clip.hardEdge,
          children: _tabWidgets,
        ),
      ),
    );
  }
}
