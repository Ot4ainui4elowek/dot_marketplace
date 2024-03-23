part of 'settings_service.dart';

class SettingsState {
  final int curentLocalization = 0;
}

class SettingsInitial extends SettingsState {
  final int curentLocalization;
  SettingsInitial({required this.curentLocalization});
}
