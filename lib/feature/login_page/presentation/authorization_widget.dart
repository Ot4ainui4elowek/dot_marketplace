import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_filled_button.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_text_button.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/password_textfield.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/phone_textfield.dart';
import 'package:dot_marketplace/feature/login_page/domain/form_control_names.dart';
import 'package:dot_marketplace/feature/login_page/domain/login_form_errors.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthorizationWidget extends StatefulWidget {
  const AuthorizationWidget({super.key});

  @override
  State<AuthorizationWidget> createState() => _AuthorizationWidgetState();
}

class _AuthorizationWidgetState extends State<AuthorizationWidget> {
  final authorizatinForm = FormGroup({
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
  });

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
            formGroup: authorizatinForm,
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
                  labelText: S.of(context).password,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          ReactiveValueListenableBuilder(
            formControl: authorizatinForm,
            builder: (context, control, child) => AppFilledButton(
              onPressed: authorizatinForm.valid
                  ? () {
                      debugPrint('auth');
                      authorizatinForm.reset();
                    }
                  : null,
              widget: const Text('Войти'),
            ),
          ),
          const SizedBox(height: 20),
          AppTextButton(
            text: 'Забыли пароль?',
            onPressed: () => 0,
          ),
        ],
      ),
    );
  }
}
