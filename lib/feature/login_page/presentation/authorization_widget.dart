import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_filled_button.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_text_button.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/app_text_field.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/password_textfield.dart';
import 'package:dot_marketplace/feature/login_page/domain/form_control_names.dart';
import 'package:dot_marketplace/feature/login_page/presentation/auth_vm.dart';
import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_variables/reactive_variables.dart';

class AuthorizationWidget extends StatefulWidget {
  final AuthViewModel vm;

  const AuthorizationWidget({
    super.key,
    required this.vm,
  });

  @override
  State<AuthorizationWidget> createState() => _AuthorizationWidgetState();
}

class _AuthorizationWidgetState extends State<AuthorizationWidget> {
  AuthViewModel get vm => widget.vm;
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
          Column(
            children: <Widget>[
              AppTextField(
                controller: vm.phoneLoginTextCtrl,
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
                controller: vm.passwordLoginTextCtrl,
                labelText: S.of(context).password,
              ),
              const SizedBox(height: 20),
            ],
          ),
          Obs(
            rvList: [vm.isLoginPossible],
            builder: (context) => AppFilledButton(
              onPressed: vm.isLoginPossible()
                  ? () {
                      debugPrint('login');
                      authorizatinForm.reset();
                    }
                  : null,
              child: Text(S.of(context).logon),
            ),
          ),
          const SizedBox(height: 20),
          AppTextButton(
            text: S.of(context).forgotPassword,
            onPressed: () => vm.goToRecoverPassword(context),
          ),
        ],
      ),
    );
  }
}
