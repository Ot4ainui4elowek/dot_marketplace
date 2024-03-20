import 'package:dot_marketplace/theme/colors.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: AppLightColors.brightness,
    primary: AppLightColors.primary,
    onPrimary: AppLightColors.onPrimary,
    secondary: Color(AppLightColors.secondary),
    onSecondary: Colors.white,
    error: AppLightColors.error,
    onError: AppLightColors.onError,
    surface: AppLightColors.surface,
    onSurface: AppLightColors.onSurface,
    background: AppLightColors.background,
    onBackground: AppLightColors.onBackground,
    tertiary: AppLightColors.tertiary,
    onTertiary: AppLightColors.onTertiary,
    primaryContainer: AppLightColors.primaryContainer,
    onPrimaryContainer: AppLightColors.onPrimaryContainer,
    secondaryContainer: AppLightColors.secondaryContainer,
    onSecondaryContainer: AppLightColors.onSecondaryContainer,
    tertiaryContainer: AppLightColors.tertiaryContainer,
    onTertiaryContainer: AppLightColors.onTertiaryContainer,
    errorContainer: AppLightColors.errorContainer,
    onErrorContainer: AppLightColors.onErrorContainer,
    outline: AppLightColors.outline,
    outlineVariant: AppLightColors.outlineVariant,
    onSurfaceVariant: AppLightColors.onSurfaceVariant,
    inverseSurface: AppLightColors.inverseSurface,
    onInverseSurface: AppLightColors.onInverseSurface,
    scrim: AppLightColors.scrim,
    shadow: AppLightColors.shadow,
    inversePrimary: AppLightColors.inversePrimary,
  ),
  useMaterial3: true,
  dropdownMenuTheme:
      const DropdownMenuThemeData(inputDecorationTheme: InputDecorationTheme()),
  inputDecorationTheme: const InputDecorationTheme(
    prefixIconColor: AppLightColors.outline,
    suffixIconColor: AppLightColors.outline,
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: AppLightColors.outline,
    ),
  ),
  iconTheme: const IconThemeData(color: AppLightColors.outline),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      height: 64 / 57,
      letterSpacing: -0.25,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      height: 52 / 45,
      letterSpacing: 0,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      height: 44 / 36,
      letterSpacing: 0,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      height: 40 / 32,
      letterSpacing: 0,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      height: 36 / 28,
      letterSpacing: 0,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      height: 32 / 24,
      letterSpacing: 0,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      height: 28 / 22,
      letterSpacing: 0,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.1,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      height: 16 / 11,
      letterSpacing: 0.5,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: 0.4,
    ),
  ),
);
