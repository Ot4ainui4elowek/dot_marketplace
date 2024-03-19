import 'package:dot_marketplace/core/presentation/UI/buttons/app_filled_button.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/password_textfield.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/phone_textfield.dart';
import 'package:dot_marketplace/feature/login_page/domain/form_control_names.dart';
import 'package:dot_marketplace/feature/login_page/domain/login_form_errors.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({super.key});

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final registratinForm = FormGroup({
    FormControlNames.phoneNumber: FormControl<String>(
      validators: [
        Validators.required,
        Validators.number,
        Validators.minLength(10),
      ],
    ),
    FormControlNames.password: FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(8),
      ],
    ),
    FormControlNames.passwordConfirmation: FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(8),
      ],
    ),
    FormControlNames.agreeWithRules: FormControl<bool>(
      value: false,
      validators: [
        Validators.requiredTrue,
      ],
    ),
  }, validators: [
    Validators.mustMatch(
        FormControlNames.password, FormControlNames.passwordConfirmation),
  ]);

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
          ReactiveForm(
            formGroup: registratinForm,
            child: Column(
              children: <Widget>[
                PhoneTextfield(
                  formControlName: FormControlNames.phoneNumber,
                  validationMeassages: {
                    'minLength': (error) =>
                        LoginFormErrors.getMinLengthMessage(10),
                  },
                ),
                const SizedBox(height: 20),
                PasswordTextField(
                  formControlName: FormControlNames.password,
                  labelText: 'Пароль',
                ),
                const SizedBox(height: 20),
                PasswordTextField(
                  formControlName: FormControlNames.passwordConfirmation,
                  labelText: 'Повторите пароль',
                  validationMeassages: {
                    'mustMatch': (error) => 'Пароли не совпадают!',
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ReactiveCheckbox(
                      formControlName: FormControlNames.agreeWithRules,
                    ),
                    const Flexible(
                      child: Text(
                          'Я согласен с Правилами и условиями использования'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ReactiveValueListenableBuilder(
            formControl: registratinForm,
            builder: (context, control, child) => AppFilledButton(
              onPressed: registratinForm.valid
                  ? () {
                      debugPrint('reg');
                      registratinForm.reset();
                    }
                  : null,
              widget: const Text('Зарегистрироваться'),
            ),
          ),
        ],
      ),
    );
  }
}
