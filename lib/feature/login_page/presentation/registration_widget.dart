import 'dart:async';

import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_filled_button.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/app_text_field.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/password_text_editing_controller.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/password_textfield.dart';
import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class RegistrationWidget extends StatefulWidget {
  final AppTextEditingController phoneRegisterTextCtrl;
  final PassTextEditingController passwordRegisterTextCtrl;
  final PassTextEditingController repeatPasswordRegisterTextCtrl;
  final Rv<bool> isUserAgreedWithPnPUsage;
  final void Function(bool?)? onCheckBoxChecked;
  final Rv<bool> isRegisterPossible;
  final Future<void> Function(BuildContext) signUp;

  const RegistrationWidget({
    super.key,
    required this.phoneRegisterTextCtrl,
    required this.passwordRegisterTextCtrl,
    required this.repeatPasswordRegisterTextCtrl,
    required this.isUserAgreedWithPnPUsage,
    required this.onCheckBoxChecked,
    required this.isRegisterPossible,
    required this.signUp,
  });
  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  String get imAgreedWith =>
      S.of(context).agreement.split(' ').getRange(0, 3).join(' ');

  String get pnPUsage {
    final wordList = S.of(context).agreement.split(' ');
    return wordList.getRange(3, wordList.length).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 100),
          AppTextField(
            controller: widget.phoneRegisterTextCtrl,
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
            controller: widget.passwordRegisterTextCtrl,
            labelText: S.of(context).password,
          ),
          const SizedBox(height: 20),
          PasswordTextField(
            controller: widget.repeatPasswordRegisterTextCtrl,
            labelText: S.of(context).repeatPassword,
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.isUserAgreedWithPnPUsage.observer(
                (context, value) => Checkbox(
                  value: value,
                  onChanged: widget.onCheckBoxChecked,
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
                          text: pnPUsage,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
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
          widget.isRegisterPossible.observer(
            (context, value) => AppFilledButton(
              onPressed: value ? () => widget.signUp(context) : null,
              child: Text(S.of(context).register),
            ),
          ),
        ],
      ),
    );
  }
}
