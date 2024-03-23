import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PhoneTextfield extends StatelessWidget {
  final String _formControlName;

  final Map<String, String Function(Object)>? _validationMeassages;

  const PhoneTextfield(
      {super.key, required String formControlName, validationMeassages})
      : _formControlName = formControlName,
        _validationMeassages = validationMeassages;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ReactiveTextField(
      formControlName: _formControlName,
      decoration: InputDecoration(
        labelStyle: theme.textTheme.bodyLarge,
        labelText: S.of(context).phone,
        prefixIcon: const Padding(
          padding: EdgeInsets.all(15),
          child: Icon(Icons.phone_outlined),
        ),
      ),
      validationMessages: {
        ...?_validationMeassages,
        'required': (error) => S.of(context).requiredField,
        'number': (error) => S.of(context).phoneNumberErrorMessage,
      },
    );
  }
}
