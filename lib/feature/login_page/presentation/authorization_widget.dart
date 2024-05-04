import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_filled_button.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/app_text_field.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/password_text_editing_controller.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/password_textfield.dart';
import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class AuthorizationWidget extends StatefulWidget {
  final AppTextEditingController phoneLoginTextCtrl;
  final PassTextEditingController passwordLoginTextCtrl;
  final Rv<bool> isLoginPossible;
  final Function(BuildContext context) goToRecoverPassword;
  final Function signIn;

  const AuthorizationWidget({
    super.key,
    required this.phoneLoginTextCtrl,
    required this.passwordLoginTextCtrl,
    required this.isLoginPossible,
    required this.goToRecoverPassword,
    required this.signIn,
  });

  @override
  State<AuthorizationWidget> createState() => _AuthorizationWidgetState();
}

class _AuthorizationWidgetState extends State<AuthorizationWidget> {
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
                controller: widget.phoneLoginTextCtrl,
                labelText: S.of(context).phone,
                keyboardType: TextInputType.phone,
                prefixIcon: const Padding(
                  padding: textFieldIconPadding,
                  child: Icon(
                    Icons.phone_outlined,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              PasswordTextField(
                controller: widget.passwordLoginTextCtrl,
                labelText: S.of(context).password,
              ),
              const SizedBox(height: 20),
            ],
          ),
          Obs(
            rvList: [widget.isLoginPossible],
            builder: (context) => AppFilledButton(
              onPressed: widget.isLoginPossible()
                  ? () => widget.signIn(context)
                  : null,
              child: Text(S.of(context).logon),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text(S.of(context).forgotPassword),
            ),
            onPressed: () => widget.goToRecoverPassword(context),
          ),
        ],
      ),
    );
  }
}
