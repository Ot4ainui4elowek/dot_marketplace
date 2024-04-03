import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/feature/edit_profile_page/domain/entity/advertisement_user_info.dart';
import 'package:dot_marketplace/feature/edit_profile_page/domain/service/advertisement_user_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AadvertisementEditProfilePageViewModel {
  AadvertisementEditProfilePageViewModel({
    required this.service,
  }) {
    firstname = AppTextEditingController(text: service.state.user.firtsName);
    lastname = AppTextEditingController(text: service.state.user.lastName);
    email = AppTextEditingController(text: service.state.user.email);
    phone = AppTextEditingController(text: service.state.user.phone);
  }
  final AdvertisementUserService service;
  late final AppTextEditingController firstname;
  late final AppTextEditingController lastname;
  late final AppTextEditingController email;
  late final AppTextEditingController phone;

  void applyChanges(BuildContext context) {
    service.add(ChangeUserInfo(user));
    context.pop();
  }

  AdvertisementUserInfo get user => AdvertisementUserInfo(
        email: email.text,
        firtsName: firstname.text,
        lastName: lastname.text,
        phone: phone.text,
      );
}
