import 'dart:developer';

import 'package:dot_marketplace/core/domain/router/dot_marketplace_routes.dart';
import 'package:dot_marketplace/core/domain/use_case_result/use_case_result.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/password_text_editing_controller.dart';
import 'package:dot_marketplace/feature/login_page/domain/entity/auth_credentials.dart';
import 'package:dot_marketplace/feature/login_page/domain/repository/auth_repository.dart';
import 'package:dot_marketplace/feature/settings/presentation/settings_modal_bs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class AuthViewModel {
  final AuthRepository _authRepository;

  AuthViewModel({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  late TabController tabController;

  final phoneLoginTextCtrl = AppTextEditingController();
  final passwordLoginTextCtrl = PassTextEditingController();
  final phoneRegisterTextCtrl = AppTextEditingController();
  final passwordRegisterTextCtrl = PassTextEditingController();
  final repeatPasswordRegisterTextCtrl = PassTextEditingController();

  final isUserAgreedWithPnPUsage = false.rv;

  final isLoginPossible = false.rv;

  final isRegisterPossible = false.rv;

  void init({
    required final TabController tabController,
  }) {
    this.tabController = tabController;
    initListeners();
  }

  void dispose() {
    disposeListeners();
  }

  void _loginPossibilityListener() {
    if (phoneLoginTextCtrl.text.isEmpty || passwordLoginTextCtrl.text.isEmpty) {
      isLoginPossible(false);
      return;
    }

    isLoginPossible(true);
  }

  void _registerPossibilityChanger() {
    if (!isUserAgreedWithPnPUsage()) {
      isRegisterPossible(false);
      return;
    }

    if (phoneRegisterTextCtrl.text.isEmpty ||
        passwordRegisterTextCtrl.text.isEmpty ||
        repeatPasswordRegisterTextCtrl.text.isEmpty) {
      isRegisterPossible(false);
      return;
    }

    // if (passwordRegisterTextCtrl.text != repeatPasswordRegisterTextCtrl.text) {
    //   isRegisterPossible(false);
    //   return;
    // }

    isRegisterPossible(true);
  }

  void goToRecoverPassword(BuildContext context) => context.go(
      '${DotMarketplaceRoutes.loginPage}/${DotMarketplaceRoutes.recoverySendingPhonePage}');

  void _goToMainPage(BuildContext context) =>
      context.go(DotMarketplaceRoutes.advertisementPage);

  void _passwordVisibilityListener() {
    repeatPasswordRegisterTextCtrl
        .isTextHidden(passwordRegisterTextCtrl.isTextHidden());
  }

  void _repeatPasswordVisibilityListener() {
    passwordRegisterTextCtrl
        .isTextHidden(repeatPasswordRegisterTextCtrl.isTextHidden());
  }

  void initListeners() {
    isUserAgreedWithPnPUsage.addListener(_registerPossibilityChanger);
    phoneLoginTextCtrl.addListener(_loginPossibilityListener);
    passwordLoginTextCtrl.addListener(_loginPossibilityListener);
    passwordRegisterTextCtrl.isTextHidden
        .addListener(_passwordVisibilityListener);
    repeatPasswordRegisterTextCtrl.isTextHidden
        .addListener(_repeatPasswordVisibilityListener);
    phoneRegisterTextCtrl.addListener(_registerPossibilityChanger);
    passwordRegisterTextCtrl.addListener(_registerPossibilityChanger);
    repeatPasswordRegisterTextCtrl.addListener(_registerPossibilityChanger);
  }

  void disposeListeners() {
    isUserAgreedWithPnPUsage.removeListener(_registerPossibilityChanger);
    phoneLoginTextCtrl.removeListener(_loginPossibilityListener);
    passwordLoginTextCtrl.removeListener(_loginPossibilityListener);
    passwordRegisterTextCtrl.isTextHidden
        .removeListener(_passwordVisibilityListener);
    repeatPasswordRegisterTextCtrl.isTextHidden
        .removeListener(_repeatPasswordVisibilityListener);
    phoneRegisterTextCtrl.removeListener(_registerPossibilityChanger);
    passwordRegisterTextCtrl.removeListener(_registerPossibilityChanger);
    repeatPasswordRegisterTextCtrl.removeListener(_registerPossibilityChanger);
  }

  void onCheckBoxChecked(bool? value) =>
      isUserAgreedWithPnPUsage(value ?? false);

  Future<void> signUp(BuildContext context) async {
    final result = await _authRepository.signIn(
      phone: phoneRegisterTextCtrl.text,
      password: passwordRegisterTextCtrl.text,
    );

    switch (result) {
      case GoodUseCaseResult<AuthCredentials>(:final data):
        log(data.jvtToken);
        _goToMainPage(context);
        break;
      case BadUseCaseResult<AuthCredentials>(:final errorList):
        for (final error in errorList) {
          log(error.code);
        }
        break;
    }
  }

  Future<void> signIn() async {
    final result = await _authRepository.signIn(
      phone: phoneRegisterTextCtrl.text,
      password: passwordRegisterTextCtrl.text,
    );

    switch (result) {
      case GoodUseCaseResult<AuthCredentials>(:final data):
        log(data.jvtToken);

        break;
      case BadUseCaseResult<AuthCredentials>(:final errorList):
        for (final error in errorList) {
          log(error.code);
        }
        break;
    }
  }

  void onSettingsTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SettingsModalBottomSheet(),
    );
  }
}
