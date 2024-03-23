import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/feature/login_page/presentation/auth_vm.dart';
import 'package:dot_marketplace/feature/settings/domain/service/settings_service.dart';
import 'package:dot_marketplace/feature/login_page/presentation/authorization_widget.dart';
import 'package:dot_marketplace/feature/login_page/presentation/registration_widget.dart';
import 'package:dot_marketplace/feature/settings/presentation/settings_modal_bs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  final AuthViewModel vm;

  const LoginPage({
    super.key,
    required this.vm,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AuthViewModel get vm => widget.vm;
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
  void initState() {
    vm.init(tabController: TabController(length: 2, vsync: this));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LoginPage oldWidget) {
    if (oldWidget.vm != widget.vm) {
      vm.init(tabController: oldWidget.vm.tabController);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

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
