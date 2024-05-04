import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_filled_button.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/password_text_editing_controller.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/password_textfield.dart';
import 'package:flutter/material.dart';

class RecoveryNewPasswordPage extends StatefulWidget {
  const RecoveryNewPasswordPage({super.key});

  @override
  State<RecoveryNewPasswordPage> createState() =>
      _RecoveryNewPasswordPageState();
}

class _RecoveryNewPasswordPageState extends State<RecoveryNewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).newPassword),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text(
                'Задайте новый пароль и подтвердите его для завершения сброса.'),
            const SizedBox(height: 20),
            PasswordTextField(
                labelText: 'Пароль', controller: PassTextEditingController()),
            const SizedBox(height: 20),
            PasswordTextField(
                labelText: 'Подтвердите пароль',
                controller: PassTextEditingController()),
            const SizedBox(height: 20),
            const AppFilledButton(
              child: Text('Сохранить новый пароль'),
            )
          ],
        ),
      ),
    );
  }
}
