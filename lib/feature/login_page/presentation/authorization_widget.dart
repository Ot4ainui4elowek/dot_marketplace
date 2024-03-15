import 'package:dot_marketplace/core/presentation/UI/buttons/app_filled_button.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_text_button.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/password_textfield.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/phone_textfield.dart';
import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';

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

  void _setPasswordIsUnvisible() =>
      passwordIsUnVisible.value = !passwordIsUnVisible.value;

  void _logInAccount() {
    canLogIn.value = passwordTextFieldController.text.isNotEmpty &&
            phoneTextFieldController.text.isNotEmpty
        ? () => debugPrint('login')
        : null;
  }

  @override
  void initState() {
    super.initState();
    passwordTextFieldController.addListener(_logInAccount);
    phoneTextFieldController.addListener(_logInAccount);
  }

  @override
  void dispose() {
    passwordTextFieldController.removeListener(_logInAccount);
    phoneTextFieldController.removeListener(_logInAccount);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: loginWidgetsVerticalPadding,
            child: PhoneTextfield(
              phoneTextFieldController: phoneTextFieldController,
            ),
          ),
          Padding(
            padding: loginWidgetsVerticalPadding,
            child: ValueListenableBuilder(
              valueListenable: passwordIsUnVisible,
              builder: (context, value, child) => PasswordTextField(
                controller: passwordTextFieldController,
                labelText: 'Пароль',
                textIsInvisible: passwordIsUnVisible.value,
                suffix: IconButton(
                  padding: textFieldIconPadding,
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  onPressed: _setPasswordIsUnvisible,
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
              builder: (context, value, child) => AppFilledButton(
                onPressed: canLogIn.value,
                widget: const Text('Войти'),
              ),
            ),
          ),
          Padding(
              padding: loginWidgetsVerticalPadding,
              child: AppTextButton(
                text: 'Забыли пароль',
                onPressed: () => 0,
              )),
        ],
      ),
    );
  }
}
