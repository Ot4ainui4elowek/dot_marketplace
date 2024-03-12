import 'package:dot_marketplace/feature/login_page/presentation/authorization_widget.dart';
import 'package:dot_marketplace/feature/login_page/presentation/registration_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _tabHeaders = <Widget>[
  const Tab(
    text: 'Вход',
  ),
  const Tab(
    text: 'Регистрация',
  ),
];

final _tabWidgets = <Widget>[
  const AuthorizationWidget(),
  const RegistrationWidget()
];

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBarView(
            children: _tabWidgets,
          ),
        ),
      ),
    );
  }
}
