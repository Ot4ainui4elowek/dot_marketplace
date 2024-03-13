import 'package:dot_marketplace/core/presentation/marketplace_text_button.dart';
import 'package:dot_marketplace/core/presentation/marketplace_text_filled_button.dart';
import 'package:dot_marketplace/core/presentation/marketplace_textfield.dart';
import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthorizationWidget extends StatefulWidget {
  const AuthorizationWidget({super.key});

  @override
  State<AuthorizationWidget> createState() => _AuthorizationWidgetState();
}

class _AuthorizationWidgetState extends State<AuthorizationWidget> {
  ValueNotifier<bool> passwordIsUnVisible = ValueNotifier<bool>(true);
  ValueNotifier<void Function()?> canLogIn =
      ValueNotifier<void Function()?>(null);

  final passwordTextFieldController = TextEditingController();
  final phoneTextFieldController = TextEditingController();

  void setPasswordIsUnvisible() =>
      passwordIsUnVisible.value = !passwordIsUnVisible.value;

  void Function()? logInAccount() =>
      passwordTextFieldController.text.isNotEmpty &&
              phoneTextFieldController.text.isNotEmpty
          ? () => debugPrint('login')
          : null;

  @override
  void initState() {
    super.initState();
    passwordTextFieldController.addListener(() {
      canLogIn.value = logInAccount();
    });
    phoneTextFieldController.addListener(() {
      canLogIn.value = logInAccount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: loginWidgetsVerticalPadding,
                  child: MarketplaceTextField(
                    controller: phoneTextFieldController,
                    labelText: 'Телефон',
                    textIsInvisible: false,
                    prefix: const Padding(
                      padding: textFieldIconPadding,
                      child: Icon(Icons.phone_outlined),
                    ),
                  ),
                ),
                Padding(
                  padding: loginWidgetsVerticalPadding,
                  child: ValueListenableBuilder(
                    valueListenable: passwordIsUnVisible,
                    builder: (context, value, child) => MarketplaceTextField(
                      controller: passwordTextFieldController,
                      labelText: 'Пароль',
                      textIsInvisible: passwordIsUnVisible.value,
                      suffix: IconButton(
                        padding: textFieldIconPadding,
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: setPasswordIsUnvisible,
                      ),
                      prefix: const Padding(
                        padding: textFieldIconPadding,
                        child: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: loginWidgetsVerticalPadding,
                    child: ValueListenableBuilder(
                      valueListenable: canLogIn,
                      builder: (context, value, child) =>
                          MarketplaceTextFilledButton(
                        onPress: canLogIn.value,
                        text: 'Войти',
                      ),
                    )),
                Padding(
                    padding: loginWidgetsVerticalPadding,
                    child: MarketplaceTextButton(
                      text: 'Забыли пароль?',
                      onPress: () => 0,
                    )),
              ],
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
