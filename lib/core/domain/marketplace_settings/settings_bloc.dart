import 'package:dot_marketplace/core/domain/marketplace_settings/app_locale.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final localeList = [
    AppLocale('ru', name: 'Русский'),
    AppLocale('en', name: 'English')
  ];

  AppLocale get curentLocale => localeList[state.curentLocalization];
  static SettingsBloc? _localization;
  factory SettingsBloc() => _localization ??= SettingsBloc._();

  SettingsBloc._() : super(SettingsInitial(curentLocalization: 0)) {
    on<EChangeLocale>((event, emit) {
      final localization = localeList.indexOf(event.newLocation);
      if (localization != -1) {
        emit(SettingsInitial(curentLocalization: localization));
      }
    });
  }
}
