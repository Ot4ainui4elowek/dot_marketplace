import 'dart:developer';

import 'package:dot_marketplace/core/domain/router/dot_marketplace_routes.dart';
import 'package:dot_marketplace/core/domain/use_case_result/use_case_result.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/feature/recovery_page/domain/entity/recovery_phone_creditinals.dart';
import 'package:dot_marketplace/feature/recovery_page/domain/repository/recovery_repository.dart';
import 'package:dot_marketplace/feature/settings/presentation/settings_modal_bs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class RecoveryPhoneViewModel {
  final RecoveryRepository _recoveryRepository;

  RecoveryPhoneViewModel({
    required RecoveryRepository recoveryRepository,
  }) : _recoveryRepository = recoveryRepository;

  final AppTextEditingController phoneCotroller = AppTextEditingController();

  final isPhoneSend = false.rv;

  void showModal(context) => showModalBottomSheet(
        context: context,
        builder: (context) => SettingsModalBottomSheet(),
      );

  void dispose() {
    disposeListeners();
  }

  void _isPhoneSendListener() => isPhoneSend(phoneCotroller.text.isNotEmpty);
  void initListener() {
    phoneCotroller.addListener(_isPhoneSendListener);
  }

  void disposeListeners() {
    phoneCotroller.removeListener(_isPhoneSendListener);
  }

  Future<void> sendPhone(BuildContext context) async {
    final result = await _recoveryRepository.sendPhoneToReceiveCode(
        number: phoneCotroller.text);
    switch (result) {
      case GoodUseCaseResult<RecoveryPhoneCredentials>(:final data):
        log('phone is valid');
        goToEnterCode(context, data);
        break;
      case BadUseCaseResult<RecoveryPhoneCredentials>(:final errorList):
        for (final error in errorList) {
          log(error.code);
        }
        break;
    }
  }

  void goToEnterCode(BuildContext context, RecoveryPhoneCredentials data) {
    context.go(
        '${DotMarketplaceRoutes.loginPage}/${DotMarketplaceRoutes.recoverySendingPhonePage}/${DotMarketplaceRoutes.recoveryCodePage}',
        extra: data.phone);
  }
}
