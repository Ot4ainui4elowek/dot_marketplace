import 'package:dot_marketplace/feature/settings/presentation/settings_modal_bs.dart';
import 'package:flutter/material.dart';

class AdvertisementProfileViewModel {
  void onSettingsTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SettingsModalBottomSheet(),
    );
  }
}
