import 'package:bloc/bloc.dart';
import 'package:dot_marketplace/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeService extends Bloc<ThemeEvent, ThemeState> {
  ThemeService() : super(ThemeInitial(false)) {
    on<SwitchThemeEvent>((event, emit) {
      emit(ThemeInitial(!state.themeIsDark));
    });
  }
}
