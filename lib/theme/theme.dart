import 'package:dot_marketplace/theme/colors.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: MarketplaceAppColors.brightness,
    primary: MarketplaceAppColors.primary,
    onPrimary: MarketplaceAppColors.onPrimary,
    secondary: Color(MarketplaceAppColors.secondary),
    onSecondary: Colors.white,
    error: MarketplaceAppColors.error,
    onError: MarketplaceAppColors.onError,
    surface: MarketplaceAppColors.surface,
    onSurface: MarketplaceAppColors.onSurface,
    background: MarketplaceAppColors.background,
    onBackground: MarketplaceAppColors.onBackground,
    tertiary: MarketplaceAppColors.tertiary,
    onTertiary: MarketplaceAppColors.onTertiary,
    primaryContainer: MarketplaceAppColors.primaryContainer,
    onPrimaryContainer: MarketplaceAppColors.onPrimaryContainer,
    secondaryContainer: MarketplaceAppColors.secondaryContainer,
    onSecondaryContainer: MarketplaceAppColors.onSecondaryContainer,
    tertiaryContainer: MarketplaceAppColors.tertiaryContainer,
    onTertiaryContainer: MarketplaceAppColors.onTertiaryContainer,
    errorContainer: MarketplaceAppColors.errorContainer,
    onErrorContainer: MarketplaceAppColors.onErrorContainer,
    outline: MarketplaceAppColors.outline,
    outlineVariant: MarketplaceAppColors.outlineVariant,
    onSurfaceVariant: MarketplaceAppColors.onSurfaceVariant,
    inverseSurface: MarketplaceAppColors.inverseSurface,
    onInverseSurface: MarketplaceAppColors.onInverseSurface,
    scrim: MarketplaceAppColors.scrim,
    shadow: MarketplaceAppColors.shadow,
    inversePrimary: MarketplaceAppColors.inversePrimary,
  ),
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    prefixIconColor: MarketplaceAppColors.outline,
    suffixIconColor: MarketplaceAppColors.outline,
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: MarketplaceAppColors.outline,
    ),
  ),
  iconTheme: const IconThemeData(color: MarketplaceAppColors.outline),
);
