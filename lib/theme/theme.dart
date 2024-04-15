import 'package:dot_marketplace/theme/app_dark_colors.dart';
import 'package:dot_marketplace/theme/app_light_colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: AppLightColors.brightness,
    primary: AppLightColors.primary,
    onPrimary: AppLightColors.onPrimary,
    secondary: AppLightColors.secondary,
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
    surfaceVariant: AppLightColors.surfaceContainer,
  ),
  navigationBarTheme: const NavigationBarThemeData(
      surfaceTintColor: AppLightColors.surfaceContainer,
      indicatorColor: AppLightColors.secondaryContainer),
  useMaterial3: true,
  dropdownMenuTheme:
      const DropdownMenuThemeData(inputDecorationTheme: InputDecorationTheme()),
  inputDecorationTheme: const InputDecorationTheme(
    prefixIconColor: AppLightColors.outline,
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
  ),
  textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero))),
  filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero))),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero))),
  iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero))),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: AppLightColors.outline,
    ),
  ),
  iconTheme: const IconThemeData(color: AppLightColors.outline),
  bottomSheetTheme: const BottomSheetThemeData(
    dragHandleColor: AppLightColors.outline,
    backgroundColor: AppLightColors.surfaceContainer,
  ),
  dividerColor: AppLightColors.outlineVariant,
  textTheme: textTheme,
);

final darkTheme = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppDarkColors.primary,
      onPrimary: AppDarkColors.onPrimary,
      secondary: AppDarkColors.secondary,
      onSecondary: AppDarkColors.onSecondary,
      error: AppDarkColors.error,
      onError: AppDarkColors.onError,
      surface: AppDarkColors.surface,
      onSurface: AppDarkColors.onSurface,
      background: AppDarkColors.surface,
      onBackground: AppDarkColors.onSurfaceContainer,
      tertiary: AppDarkColors.tertiary,
      onTertiary: AppDarkColors.onTertiary,
      primaryContainer: AppDarkColors.primaryContainer,
      onPrimaryContainer: AppDarkColors.onPrimaryContainer,
      secondaryContainer: AppDarkColors.secondaryContainer,
      onSecondaryContainer: AppDarkColors.onSecondaryContainer,
      tertiaryContainer: AppDarkColors.tertiaryContainer,
      onTertiaryContainer: AppDarkColors.onTertiaryContainer,
      errorContainer: AppDarkColors.errorContainer,
      onErrorContainer: AppDarkColors.onErrorContainer,
      outline: AppDarkColors.outline,
      outlineVariant: AppDarkColors.outlineVariant,
      onSurfaceVariant: AppDarkColors.onSurfaceVariant,
      inverseSurface: AppDarkColors.inverseSurface,
      onInverseSurface: AppDarkColors.onInverseSurface,
      scrim: AppDarkColors.scrim,
      shadow: AppDarkColors.shadow,
      inversePrimary: AppDarkColors.inversePrimary,
      surfaceVariant: AppDarkColors.onSurfaceContainerHight),
  navigationBarTheme: const NavigationBarThemeData(
      surfaceTintColor: AppDarkColors.surfaceContainer,
      indicatorColor: AppDarkColors.secondaryContainer),
  useMaterial3: true,
  dropdownMenuTheme:
      const DropdownMenuThemeData(inputDecorationTheme: InputDecorationTheme()),
  inputDecorationTheme: const InputDecorationTheme(
    prefixIconColor: AppDarkColors.outline,
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
  ),
  textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero))),
  filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero))),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero))),
  iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero))),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppDarkColors.surfaceContainer,
    elevation: 0,
    iconTheme: IconThemeData(
      color: AppDarkColors.outline,
    ),
  ),
  iconTheme: const IconThemeData(color: AppDarkColors.outline),
  bottomSheetTheme: const BottomSheetThemeData(
    dragHandleColor: AppDarkColors.outline,
    backgroundColor: AppDarkColors.surfaceContainer,
  ),
  dividerColor: AppDarkColors.outlineVariant,
  textTheme: textTheme,
);

const textTheme = TextTheme(
  displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      height: 64 / 57,
      letterSpacing: -.25),
  displayMedium: TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    height: 52 / 45,
  ),
  displaySmall: TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 44 / 36,
  ),
  headlineLarge: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    height: 40 / 32,
  ),
  headlineMedium: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 36 / 28,
  ),
  headlineSmall: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 32 / 24,
  ),
  titleLarge: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 28 / 22,
  ),
  titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 24 / 16,
      letterSpacing: .15),
  titleSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
    letterSpacing: .1,
  ),
  labelLarge: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
    letterSpacing: .1,
  ),
  labelMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    letterSpacing: .5,
  ),
  labelSmall: TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 16 / 11,
    letterSpacing: .5,
  ),
  bodyLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    letterSpacing: .5,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    letterSpacing: .25,
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    letterSpacing: .4,
  ),
);
