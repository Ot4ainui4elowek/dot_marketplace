import 'package:dot_marketplace/core/presentation/marketplace_text_button.dart';
import 'package:dot_marketplace/core/presentation/marketplace_text_filled_button.dart';
import 'package:dot_marketplace/core/presentation/marketplace_textfield.dart';
import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({super.key});

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  ValueNotifier<bool> isAgree = ValueNotifier<bool>(false);
  ValueNotifier<bool> passwordTextIsUnVisible = ValueNotifier<bool>(true);
  ValueNotifier<bool> passwordConfirmationTextIsUnVisible =
      ValueNotifier<bool>(true);
  ValueNotifier<void Function()?> canLogIn =
      ValueNotifier<void Function()?>(null);

  final passwordTextFieldController = TextEditingController();
  final passwordConfirmationTextFieldController = TextEditingController();
  final phoneTextFieldController = TextEditingController();

  void setPasswordIsUnvisible() =>
      passwordTextIsUnVisible.value = !passwordTextIsUnVisible.value;
  void setpasswordConfirmationTextIsUnVisible() =>
      passwordConfirmationTextIsUnVisible.value =
          !passwordConfirmationTextIsUnVisible.value;

  void Function()? logInAccount() =>
      passwordTextFieldController.text.isNotEmpty &&
              phoneTextFieldController.text.isNotEmpty &&
              passwordConfirmationTextFieldController.text.isNotEmpty &&
              isAgree.value
          ? () => debugPrint('login')
          : null;

  @override
  void initState() {
    super.initState();
    passwordConfirmationTextFieldController.addListener(() {
      canLogIn.value = logInAccount();
    });
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
          mainAxisAlignment: MainAxisAlignment.center,
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
                    valueListenable: passwordTextIsUnVisible,
                    builder: (context, value, child) => MarketplaceTextField(
                      controller: passwordTextFieldController,
                      labelText: 'Пароль',
                      textIsInvisible: passwordTextIsUnVisible.value,
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
                    valueListenable: passwordConfirmationTextIsUnVisible,
                    builder: (context, value, child) => MarketplaceTextField(
                      controller: passwordConfirmationTextFieldController,
                      labelText: 'Повторите пароль',
                      textIsInvisible:
                          passwordConfirmationTextIsUnVisible.value,
                      suffix: IconButton(
                        padding: textFieldIconPadding,
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: setpasswordConfirmationTextIsUnVisible,
                      ),
                      prefix: const Padding(
                        padding: textFieldIconPadding,
                        child: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: isAgree,
                      builder: (context, value, child) => Checkbox(
                        value: isAgree.value,
                        onChanged: (value) {
                          value = isAgree.value = !isAgree.value;
                          canLogIn.value = logInAccount();
                        },
                      ),
                    ),
                    Flexible(
                      child: Text(
                          'Я согласен с Правилами и условиями использования'),
                    ),
                  ],
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
