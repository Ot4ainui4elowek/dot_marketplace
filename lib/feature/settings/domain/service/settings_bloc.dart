import 'package:dot_marketplace/feature/settings/domain/entity/app_locale.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsService extends Bloc<SettingsEvent, SettingsState> {
  final localeList = [
    AppLocale('ru', name: 'Русский'),
    AppLocale('en', name: 'English')
  ];

  AppLocale get curentLocale => localeList[state.curentLocalization];
  static SettingsService? _localization;
  factory SettingsService() => _localization ??= SettingsService._();

  SettingsService._() : super(SettingsInitial(curentLocalization: 0)) {
    on<ChangeLocaleEvent>((event, emit) {
      final localization = localeList.indexOf(event.newLocation);
      if (localization != -1) {
        emit(SettingsInitial(curentLocalization: localization));
      }
    });
  }
}
