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
  Widget get localizationBottomSheet => BottomSheet(
        builder: (context) => Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Настройки'),
                  AppTextButton(
                    text: 'готово',
                    onPressed: () => context.pop(),
                  )
                ],
              ),
              const SizedBox(height: 16),
              DropdownMenu(
                  label: const Text('Язык приложения'),
                  onSelected: (value) {
                    if (value != null) {
                      settingService.add(EChangeLocale(value));
                    }
                  },
                  expandedInsets: EdgeInsets.zero,
                  dropdownMenuEntries: settingService.localeList
                      .map((e) => DropdownMenuEntry(value: e, label: e.name))
                      .toList())
            ],
          ),
        ),
        onClosing: () => 0,
      );

  List<Widget> get _tabHeaders => <Widget>[
        const Tab(
          text: 'Вход',
        ),
        const Tab(
          text: 'Регистрация',
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
