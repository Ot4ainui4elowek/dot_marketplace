import 'package:flutter/material.dart';

class PhoneTextfield extends StatelessWidget {
  final TextEditingController _phoneTextFieldController;

  const PhoneTextfield(
      {super.key, required TextEditingController phoneTextFieldController})
      : _phoneTextFieldController = phoneTextFieldController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _phoneTextFieldController,
      decoration: const InputDecoration(
        labelText: 'Телефон',
        prefixIcon: Padding(
          padding: EdgeInsets.all(15),
          child: Icon(Icons.phone_outlined),
        ),
      ),
    );
  }
}
