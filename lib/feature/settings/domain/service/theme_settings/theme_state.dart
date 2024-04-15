part of 'theme_service.dart';

@immutable
sealed class ThemeState {
  final bool themeIsDark = false;
  final ThemeData theme = lightTheme;
}

final class ThemeInitial extends ThemeState {
  ThemeInitial(this.themeIsDark) {
    theme = themeIsDark ? darkTheme : lightTheme;
  }
  @override
  final bool themeIsDark;
  @override
  late final ThemeData theme;
}
