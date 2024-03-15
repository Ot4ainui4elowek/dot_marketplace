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
              onPressed: () => 0,
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
