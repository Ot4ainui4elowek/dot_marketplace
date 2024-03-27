part of 'settings_service.dart';

class SettingsEvent {}

class ChangeLocaleEvent extends SettingsEvent {
  final AppLocale newLocation;
  ChangeLocaleEvent(this.newLocation);
}
