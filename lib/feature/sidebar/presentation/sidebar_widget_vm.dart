import 'package:dot_marketplace/feature/settings/presentation/settings_modal_bs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SidebarWidgetViewModel {
  void onSettingsTap(BuildContext context) {
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (context) => SettingsModalBottomSheet(),
    );
    context.pop();
  }
}
