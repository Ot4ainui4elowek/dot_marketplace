import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/core/presentation/UI/app_bar/app_bar.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_filled_button.dart';
import 'package:dot_marketplace/core/presentation/UI/buttons/app_elevated_button.dart';
import 'package:dot_marketplace/feature/recovery_page/presentation/recovery_code_confirm_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class RecoveryCodeConfirm extends StatefulWidget {
  const RecoveryCodeConfirm({
    super.key,
    required this.vm,
    required this.number,
  });
  final RecoveryCodeConfirmViewModel vm;
  final String number;

  @override
  State<RecoveryCodeConfirm> createState() => _RecoveryCodeConfirmState();
}

class _RecoveryCodeConfirmState extends State<RecoveryCodeConfirm> {
  RecoveryCodeConfirmViewModel get vm => widget.vm;

  void _changeFocusScope({required String value, required int index}) {
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    } else if (value.length == 1 && index < vm.codeControllers.length - 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  Widget get rowCodeFields {
    final codeFieldList = List.generate(
      vm.codeControllers.length - 1,
      (index) => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: TextField(
            controller: vm.codeControllers[index],
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: 1,
            textAlign: TextAlign.center,
            onChanged: (String value) {
              _changeFocusScope(value: value, index: index);
            },
            decoration: const InputDecoration(
              counterText: '',
            ),
          ),
        ),
      ),
    );
    codeFieldList.add(
      Expanded(
        child: TextField(
          controller: vm.codeControllers.last,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          maxLength: 1,
          textAlign: TextAlign.center,
          onChanged: (String value) {
            _changeFocusScope(
                value: value, index: vm.codeControllers.length - 1);
          },
          decoration: const InputDecoration(
            counterText: '',
          ),
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: codeFieldList,
    );
  }

  @override
  void initState() {
    super.initState();
    vm.initListener();
  }

  @override
  void didUpdateWidget(covariant RecoveryCodeConfirm oldWidget) {
    if (oldWidget.vm != widget.vm) {
      vm.initListener();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    vm.removeListeners();
  }

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
            onPressed: () => vm.showModal(context),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100),
            Text(
              '${S.of(context).enterACode} ${widget.number}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            rowCodeFields,
            const SizedBox(height: 20),
            vm.isReadyToSent.observer(
              (context, value) => AppFilledButton(
                child: Text(S.of(context).codePageConfirm),
                onPressed: value ? () => vm.sendCode(context) : null,
              ),
            ),
            const SizedBox(height: 20),
            AppElevatedButton(
              child: Text(S.of(context).codePageResend),
              onPressed: () => vm.sendPhone(
                  context, GoRouterState.of(context).extra.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
