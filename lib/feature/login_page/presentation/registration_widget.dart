import 'package:dot_marketplace/core/presentation/UI/buttons/app_filled_button.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/password_textfield.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/phone_textfield.dart';
import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({super.key});

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  ValueNotifier<bool> isAgreeWitchRules = ValueNotifier<bool>(false);
  ValueNotifier<void Function()?> canLogIn =
      ValueNotifier<void Function()?>(null);

  final passwordTextFieldController = TextEditingController();
  final passwordConfirmationTextFieldController = TextEditingController();
  final phoneTextFieldController = TextEditingController();

  void _logInAccount() {
    canLogIn.value = passwordTextFieldController.text.isNotEmpty &&
            phoneTextFieldController.text.isNotEmpty &&
            passwordConfirmationTextFieldController.text.isNotEmpty &&
            isAgreeWitchRules.value
        ? () => debugPrint('login')
        : null;
  }

  @override
  void initState() {
    super.initState();
    passwordConfirmationTextFieldController.addListener(_logInAccount);
    passwordTextFieldController.addListener(_logInAccount);
    isAgreeWitchRules.addListener(_logInAccount);
    phoneTextFieldController.addListener(_logInAccount);
  }

  @override
  void dispose() {
    passwordConfirmationTextFieldController.removeListener(_logInAccount);
    passwordTextFieldController.removeListener(_logInAccount);
    isAgreeWitchRules.removeListener(_logInAccount);
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
              )),
          Padding(
            padding: loginWidgetsVerticalPadding,
            child: PasswordTextField(
              controller: passwordTextFieldController,
              labelText: 'Пароль',
            ),
          ),
          Padding(
            padding: loginWidgetsVerticalPadding,
            child: PasswordTextField(
              controller: passwordConfirmationTextFieldController,
              labelText: 'Повторите пароль',
            ),
          ),
          Padding(
            padding: verticalPadding10,
            child: Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: isAgreeWitchRules,
                  builder: (context, value, child) => Checkbox(
                    value: isAgreeWitchRules.value,
                    onChanged: (value) {
                      value =
                          isAgreeWitchRules.value = !isAgreeWitchRules.value;
                    },
                  ),
                ),
                const Flexible(
                  child:
                      Text('Я согласен с Правилами и условиями использования'),
                ),
              ],
            ),
          ),
          Padding(
              padding: loginWidgetsVerticalPadding,
              child: ValueListenableBuilder(
                valueListenable: canLogIn,
                builder: (context, value, child) => AppFilledButton(
                  onPressed: canLogIn.value,
                  widget: const Text('Зарегистрироваться'),
                ),
              )),
        ],
      ),
    );
  }
}
