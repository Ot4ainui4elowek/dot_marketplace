import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_filled_button.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/password_textfield.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/phone_textfield.dart';
import 'package:dot_marketplace/feature/login_page/domain/form_control_names.dart';
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
                    'minLength': (error) => S.of(context).minLength(10),
                  },
                ),
                const SizedBox(height: 20),
                PasswordTextField(
                  formControlName: FormControlNames.password,
                  labelText: S.of(context).password,
                ),
                const SizedBox(height: 20),
                PasswordTextField(
                  formControlName: FormControlNames.passwordConfirmation,
                  labelText: S.of(context).repeatPassword,
                  validationMeassages: {
                    'mustMatch': (error) => S.of(context).passwordMismatch,
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ReactiveCheckbox(
                      formControlName: FormControlNames.agreeWithRules,
                    ),
                    Flexible(
                      child: Text(S.of(context).agreement),
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
              widget: Text(S.of(context).register),
            ),
          ),
        ],
      ),
    );
  }
}
