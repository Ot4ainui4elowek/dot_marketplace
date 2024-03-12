import 'dart:js';

import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFDF3A76),
    onPrimary: Colors.white,
    secondary: Color(0xFFB61263),
    onSecondary: Colors.white,
    error: Color(0xFFBA1A1A),
    onError: Colors.white,
    surface: Color(0xFFFFF8F9),
    onSurface: Color(0xFF211A1D),
    background: Colors.white,
    onBackground: Colors.white,
    tertiary: Color(0xFF743EC8),
    onTertiary: Colors.white,
    primaryContainer: Color(0xFFFFD8EC),
    onPrimaryContainer: Color(0xFF37072A),
    secondaryContainer: Color(0xFFFFD9E2),
    onSecondaryContainer: Color(0xFF3A071D),
    tertiaryContainer: Color(0xFFECDCFF),
    onTertiaryContainer: Color(0xFF240E45),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    outline: Color(0xFF81737A),
    outlineVariant: Color(0xFFD3C2C9),
    onSurfaceVariant: Color(0xFF4F4449),
    inverseSurface: Color(0xFF362E32),
    onInverseSurface: Color(0xFFFCEDF2),
    scrim: Colors.black,
    shadow: Colors.black,
    inversePrimary: Color(0xFFF9B1DB),
  ),
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    prefixIconColor: Color(0xFF81737A),
    suffixIconColor: Color(0xFF81737A),
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Color(0xFF81737A),
    ),
  ),
  iconTheme: const IconThemeData(color: Color(0xFF81737A)),
);
