import 'dart:developer';

import 'package:dot_marketplace/core/domain/router/dot_marketplace_routes.dart';
import 'package:dot_marketplace/core/domain/use_case_result/use_case_result.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/feature/recovery_page/domain/entity/recovery_code_creditinals.dart';
import 'package:dot_marketplace/feature/recovery_page/domain/entity/recovery_phone_creditinals.dart';
import 'package:dot_marketplace/feature/recovery_page/domain/repository/recovery_repository.dart';
import 'package:dot_marketplace/feature/settings/domain/service/settings_service.dart';
import 'package:dot_marketplace/feature/settings/presentation/settings_modal_bs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class RecoveryCodeConfirmViewModel {
  final RecoveryRepository _recoveryRepository;
  final SettingsService _settingsService;

  RecoveryCodeConfirmViewModel({
    required RecoveryRepository recoveryRepository,
    required SettingsService settingService,
  })  : _recoveryRepository = recoveryRepository,
        _settingsService = settingService;

  final List<AppTextEditingController> codeControllers = [
    AppTextEditingController(),
    AppTextEditingController(),
    AppTextEditingController(),
    AppTextEditingController(),
  ];

  final isReadyToSent = false.rv;

  void _isReadyToSentListener() => isReadyToSent(
      codeControllers.every((controller) => controller.text.isNotEmpty));

  void showModal(context) => showModalBottomSheet(
        context: context,
        builder: (context) =>
            SettingsModalBottomSheet(settingsService: _settingsService),
      );

  void initListener() {
    for (AppTextEditingController controller in codeControllers) {
      controller.addListener(_isReadyToSentListener);
    }
    // codeControllers.last.addListener(_isReadyToSentListener);
  }

  void removeListeners() {
    for (AppTextEditingController controller in codeControllers) {
      controller.removeListener(_isReadyToSentListener);
    }
  }

  Future<void> sendPhone(BuildContext context, String number) async {
    final result =
        await _recoveryRepository.sendPhoneToReceiveCode(number: number);
    switch (result) {
      case GoodUseCaseResult<RecoveryPhoneCredentials>(:final data):
        log(data.phone);
        break;
      case BadUseCaseResult<RecoveryPhoneCredentials>(:final errorList):
        for (final error in errorList) {
          log(error.code);
        }
        break;
    }
  }

  Future<void> sendCode(BuildContext context) async {
    final result = await _recoveryRepository.confirmCode(
        code: codeControllers.map((e) => e.text).join(''));
    switch (result) {
      case GoodUseCaseResult<RecoveryCodeCredentials>(:final data):
        log(data.isConfirmed.toString());
        _goToNewPasswordPage(context);
        break;
      case BadUseCaseResult<RecoveryCodeCredentials>(:final errorList):
        for (final error in errorList) {
          log(error.code);
        }
        break;
    }
  }

  void _goToNewPasswordPage(BuildContext context) => context.push(
      '${DotMarketplaceRoutes.loginPage}/${DotMarketplaceRoutes.recoverySendingPhonePage}/${DotMarketplaceRoutes.newPasswordPage}');
}
