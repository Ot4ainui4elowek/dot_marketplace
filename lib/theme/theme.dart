import 'package:dot_marketplace/theme/colors.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: AppColors.brightness,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    secondary: Color(AppColors.secondary),
    onSecondary: Colors.white,
    error: AppColors.error,
    onError: AppColors.onError,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    background: AppColors.background,
    onBackground: AppColors.onBackground,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onTertiary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    tertiaryContainer: AppColors.tertiaryContainer,
    onTertiaryContainer: AppColors.onTertiaryContainer,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.onErrorContainer,
    outline: AppColors.outline,
    outlineVariant: AppColors.outlineVariant,
    onSurfaceVariant: AppColors.onSurfaceVariant,
    inverseSurface: AppColors.inverseSurface,
    onInverseSurface: AppColors.onInverseSurface,
    scrim: AppColors.scrim,
    shadow: AppColors.shadow,
    inversePrimary: AppColors.inversePrimary,
  ),
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    prefixIconColor: AppColors.outline,
    suffixIconColor: AppColors.outline,
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: AppColors.outline,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.outline),
);
