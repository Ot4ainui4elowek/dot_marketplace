part of 'settings_bloc.dart';

class SettingsEvent {}

class ChangeLocaleEvent extends SettingsEvent {
  final AppLocale newLocation;
  ChangeLocaleEvent(this.newLocation);
}
