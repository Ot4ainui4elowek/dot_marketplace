import 'dart:developer';

import 'package:dot_marketplace/core/domain/router/dot_marketplace_routes.dart';
import 'package:dot_marketplace/core/domain/use_case_result/use_case_result.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/feature/recovery_page/domain/entity/recovery_phone_creditinals.dart';
import 'package:dot_marketplace/feature/recovery_page/domain/repository/recovery_repository.dart';
import 'package:dot_marketplace/feature/settings/domain/service/settings_service.dart';
import 'package:dot_marketplace/feature/settings/presentation/settings_modal_bs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class RecoveryPhoneViewModel {
  final RecoveryRepository _recoveryRepository;
  final SettingsService _settingsService;

  RecoveryPhoneViewModel({
    required RecoveryRepository recoveryRepository,
    required SettingsService settingService,
  })  : _recoveryRepository = recoveryRepository,
        _settingsService = settingService;

  final AppTextEditingController phoneCotroller = AppTextEditingController();

  final isPhoneSend = false.rv;

  void showModal(context) => showModalBottomSheet(
        context: context,
        builder: (context) =>
            SettingsModalBottomSheet(settingsService: _settingsService),
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

  Future<void> goToCode(BuildContext context) async {
    final result =
        await _recoveryRepository.sendCode(number: phoneCotroller.text);
    switch (result) {
      case GoodUseCaseResult<RecoveryPhoneCredentials>(:final data):
        log('phone is valid');
        context.pushReplacement(
            '${DotMarketplaceRoutes.loginPage}/${DotMarketplaceRoutes.recoveryCodePage}',
            extra: data.phone);
        break;
      case BadUseCaseResult<RecoveryPhoneCredentials>(:final errorList):
        for (final error in errorList) {
          log(error.code);
        }
        break;
    }
  }
}
