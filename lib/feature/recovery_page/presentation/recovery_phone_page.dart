import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/core/presentation/UI/app_bar/app_bar.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_filled_button.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/app_text_field.dart';
import 'package:dot_marketplace/feature/recovery_page/presentation/recovery_phone_vm.dart';
import 'package:dot_marketplace/theme/styles.dart';
import 'package:flutter/material.dart';

class RecoveryPhonePage extends StatefulWidget {
  final RecoveryPhoneViewModel vm;

  const RecoveryPhonePage({super.key, required this.vm});

  @override
  State<RecoveryPhonePage> createState() => _RecoveryPhonePageState();
}

class _RecoveryPhonePageState extends State<RecoveryPhonePage> {
  RecoveryPhoneViewModel get vm => widget.vm;

  @override
  void initState() {
    super.initState();
    vm.initListener();
  }

  @override
  void dispose() {
    super.dispose();
    vm.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
            ),
            onPressed: () => vm.showModal(context),
          ),
          const SizedBox(width: 8),
        ],
        title: Text(
          S.of(context).restorePassword,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Text(S.of(context).registrationPhoneInputTitle),
            const SizedBox(height: 20),
            AppTextField(
              prefixIcon: const Padding(
                padding: textFieldIconPadding,
                child: Icon(Icons.phone_outlined),
              ),
              labelText: S.of(context).phone,
              controller: vm.phoneCotroller,
            ),
            const SizedBox(height: 20),
            vm.isPhoneSend.observer((context, value) => AppFilledButton(
                  onPressed: value ? () => vm.goToCode(context) : null,
                  child: Text(S.of(context).send),
                ))
          ],
        ),
      ),
    );
  }
}
