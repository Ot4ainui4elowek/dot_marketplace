part of 'settings_bloc.dart';

class SettingsEvent {}

class EChangeLocale extends SettingsEvent {
  final AppLocale newLocation;
  EChangeLocale(this.newLocation);
}
