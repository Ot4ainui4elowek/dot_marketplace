import 'package:dot_marketplace/core/presentation/UI/app_bar/app_bar.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/app_text_field.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecoveryCodeConfirm extends StatefulWidget {
  const RecoveryCodeConfirm({super.key});

  @override
  State<RecoveryCodeConfirm> createState() => _RecoveryCodeConfirmState();
}

class _RecoveryCodeConfirmState extends State<RecoveryCodeConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: Text(
          'Введите код',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
            ),
            onPressed: () => 0,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Text(
                'Введите код, отправленный на ${GoRouterState.of(context).extra}'),
            const SizedBox(height: 20),
            AppTextField(labelText: '', controller: AppTextEditingController()),
          ],
        ),
      ),
    );
  }
}
