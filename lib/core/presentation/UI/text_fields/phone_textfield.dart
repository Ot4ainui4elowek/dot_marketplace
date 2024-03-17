import 'package:dot_marketplace/feature/login_page/domain/login_form_errors.dart';
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
    return ReactiveTextField(
      formControlName: _formControlName,
      decoration: const InputDecoration(
        labelText: 'Телефон',
        prefixIcon: Padding(
          padding: EdgeInsets.all(15),
          child: Icon(Icons.phone_outlined),
        ),
      ),
      validationMessages: {
        ...?_validationMeassages,
        'required': (error) => LoginFormErrors.requiredErrorMeassge,
        'number': (error) => LoginFormErrors.phoneNumberErrorMessage,
      },
    );
  }
}
