import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/feature/settings/domain/service/settings_bloc.dart';
import 'package:dot_marketplace/feature/login_page/presentation/authorization_widget.dart';
import 'package:dot_marketplace/feature/login_page/presentation/registration_widget.dart';
import 'package:dot_marketplace/feature/settings/presentation/settings_modal_bs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final settingService = SettingsService();
  Widget get localizationBottomSheet =>
      SettingsModalBottomSheet(settingsService: settingService);

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
                Icons.settings_outlined,
              ),
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => localizationBottomSheet,
              ),
            ),
            const SizedBox(width: 8),
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
