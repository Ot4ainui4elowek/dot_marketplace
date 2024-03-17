import 'package:dot_marketplace/feature/login_page/domain/login_form_errors.dart';
import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PasswordTextField extends StatelessWidget {
  final ValueNotifier<bool> _textIsInvisible = ValueNotifier<bool>(true);

  final String _formControlName;

  final Map<String, String Function(Object)>? _validationMeassages;

  void _setPasswordISVisible() =>
      _textIsInvisible.value = !_textIsInvisible.value;

  final String labelText;

  PasswordTextField({
    super.key,
    required this.labelText,
    required formControlName,
    validationMeassages,
  })  : _formControlName = formControlName,
        _validationMeassages = validationMeassages;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _textIsInvisible,
      builder: (context, value, child) => ReactiveTextField(
        formControlName: _formControlName,
        obscureText: _textIsInvisible.value,
        decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: textFieldIconPadding,
            child: Icon(Icons.lock_outline),
          ),
          suffixIcon: IconButton(
            padding: textFieldIconPadding,
            icon: const Icon(Icons.remove_red_eye_outlined),
            onPressed: _setPasswordISVisible,
          ),
          labelText: labelText,
        ),
        validationMessages: {
          ...?_validationMeassages,
          'required': (error) => LoginFormErrors.requiredErrorMeassge,
          'minLength': (error) => LoginFormErrors.getMinLengthMessage(8),
        },
      ),
    );
  }
}
