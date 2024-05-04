part of 'theme_service.dart';

@immutable
sealed class ThemeEvent {}

class SwitchThemeEvent extends ThemeEvent {}
