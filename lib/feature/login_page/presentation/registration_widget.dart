import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_filled_button.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/app_text_field.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/password_textfield.dart';
import 'package:dot_marketplace/feature/login_page/domain/form_control_names.dart';
import 'package:dot_marketplace/feature/login_page/presentation/auth_vm.dart';
import 'package:dot_marketplace/theme/app_light_colors.dart';
import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegistrationWidget extends StatefulWidget {
  final AuthViewModel vm;

  const RegistrationWidget({
    super.key,
    required this.vm,
  });
  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  AuthViewModel get vm => widget.vm;
  String get imAgreedWith =>
      S.of(context).agreement.split(' ').getRange(0, 3).join(' ');

  String get PnPUsage {
    final wordList = S.of(context).agreement.split(' ');
    return wordList.getRange(3, wordList.length).join(' ');
  }

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
        children: [
          const SizedBox(height: 100),
          AppTextField(
            controller: vm.phoneRegisterTextCtrl,
            labelText: S.of(context).phone,
            prefixIcon: const Padding(
              padding: textFieldIconPadding,
              child: Icon(
                Icons.phone_outlined,
              ),
            ),
          ),
          const SizedBox(height: 20),
          PasswordTextField(
            controller: vm.passwordRegisterTextCtrl,
            labelText: S.of(context).password,
          ),
          const SizedBox(height: 20),
          PasswordTextField(
            controller: vm.repeatPasswordRegisterTextCtrl,
            labelText: S.of(context).repeatPassword,
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              vm.isUserAgreedWithPnPUsage.observer(
                (context, value) => Checkbox(
                  value: value,
                  onChanged: vm.onCheckBoxChecked,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: RichText(
                    maxLines: 2,
                    textHeightBehavior: const TextHeightBehavior(),
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$imAgreedWith ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        TextSpan(
                          text: PnPUsage,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppLightColors.primary,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          vm.isRegisterPossible.observer(
            (context, value) => AppFilledButton(
              onPressed: value ? vm.signUp : null,
              child: Text(S.of(context).register),
            ),
          ),
        ],
      ),
    );
  }
}
