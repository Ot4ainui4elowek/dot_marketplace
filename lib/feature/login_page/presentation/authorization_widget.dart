import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';

class AuthorizationWidget extends StatefulWidget {
  const AuthorizationWidget({super.key});

  @override
  State<AuthorizationWidget> createState() => _AuthorizationWidgetState();
}

class _AuthorizationWidgetState extends State<AuthorizationWidget> {
  bool passwordIsUnVisible = true;

  final passwordFieldController = TextEditingController();

  void setPasswordVisible() {
    setState(() {
      passwordIsUnVisible = !passwordIsUnVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: loginWidgetsVerticalPadding,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: textFieldIconPadding,
                      child: Icon(
                        Icons.phone_outlined,
                      ),
                    ),
                    labelText: 'Телефон',
                    border: OutlineInputBorder(
                      borderRadius: inputBorderRadius,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: loginWidgetsVerticalPadding,
                child: TextField(
                  controller: passwordFieldController,
                  obscureText: passwordIsUnVisible,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: textFieldIconPadding,
                      child: Icon(
                        Icons.lock_outline,
                      ),
                    ),
                    suffixIcon: IconButton(
                      padding: textFieldIconPadding,
                      icon: const Icon(
                        Icons.remove_red_eye_outlined,
                      ),
                      onPressed: () => setPasswordVisible(),
                    ),
                    labelText: 'Пароль',
                    border: const OutlineInputBorder(
                      borderRadius: inputBorderRadius,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: loginWidgetsVerticalPadding,
                    child: FilledButton(
                      onPressed: () => 0,
                      child: const Padding(
                        padding: buttonVerticalPadding,
                        child: Text('Войти'),
                      ),
                    ),
                  ),
                  Container(
                    padding: loginWidgetsVerticalPadding,
                    child: TextButton(
                      onPressed: () => 0,
                      child: const Padding(
                        padding: buttonVerticalPadding,
                        child: Text('Забыли пароль?'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(),
        ],
      ),
    );
  }
}
