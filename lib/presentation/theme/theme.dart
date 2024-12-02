import "package:flutter/material.dart";

/// A class that provides various pre-defined themes for a Flutter application.
///
/// The `MaterialTheme` class offers a set of predefined color schemes and `ThemeData` objects,
/// including light and dark themes with different contrast levels.
/// The themes are designed to follow Material Design principles,
/// and the class makes it easy to apply these themes in your Flutter app.
///
/// This class is generated using the Material Theme Builder,
/// which allows you to customize and generate themes based on your application's design needs.
/// For more information about the Material Theme Builder and how the themes are structured,
/// refer to the documentation [here](https://material-foundation.github.io/material-theme-builder/).

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff755085),
      surfaceTint: Color(0xff755085),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfff7d8ff),
      onPrimaryContainer: Color(0xff2d0b3d),
      secondary: Color(0xff69596d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff1dcf4),
      onSecondaryContainer: Color(0xff231728),
      tertiary: Color(0xff815251),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdad8),
      onTertiaryContainer: Color(0xff331111),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff7fb),
      onSurface: Color(0xff1e1a1f),
      onSurfaceVariant: Color(0xff4c444d),
      outline: Color(0xff7d747e),
      outlineVariant: Color(0xffcec3cd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f34),
      inversePrimary: Color(0xffe3b7f3),
      primaryFixed: Color(0xfff7d8ff),
      onPrimaryFixed: Color(0xff2d0b3d),
      primaryFixedDim: Color(0xffe3b7f3),
      onPrimaryFixedVariant: Color(0xff5c396c),
      secondaryFixed: Color(0xfff1dcf4),
      onSecondaryFixed: Color(0xff231728),
      secondaryFixedDim: Color(0xffd4c0d7),
      onSecondaryFixedVariant: Color(0xff504255),
      tertiaryFixed: Color(0xffffdad8),
      onTertiaryFixed: Color(0xff331111),
      tertiaryFixedDim: Color(0xfff5b7b5),
      onTertiaryFixedVariant: Color(0xff663b3a),
      surfaceDim: Color(0xffe1d7df),
      surfaceBright: Color(0xfffff7fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf1f8),
      surfaceContainer: Color(0xfff5ebf3),
      surfaceContainerHigh: Color(0xffefe5ed),
      surfaceContainerHighest: Color(0xffe9e0e7),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff583567),
      surfaceTint: Color(0xff755085),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff8d669d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4c3e51),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff806f84),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff623736),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9a6766),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7fb),
      onSurface: Color(0xff1e1a1f),
      onSurfaceVariant: Color(0xff484049),
      outline: Color(0xff655c65),
      outlineVariant: Color(0xff817881),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f34),
      inversePrimary: Color(0xffe3b7f3),
      primaryFixed: Color(0xff8d669d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff734e82),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff806f84),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff66576b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff9a6766),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff7f4f4e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe1d7df),
      surfaceBright: Color(0xfffff7fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf1f8),
      surfaceContainer: Color(0xfff5ebf3),
      surfaceContainerHigh: Color(0xffefe5ed),
      surfaceContainerHighest: Color(0xffe9e0e7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff341344),
      surfaceTint: Color(0xff755085),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff583567),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2a1e2f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4c3e51),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3b1717),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff623736),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7fb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff282229),
      outline: Color(0xff484049),
      outlineVariant: Color(0xff484049),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f34),
      inversePrimary: Color(0xfffbe5ff),
      primaryFixed: Color(0xff583567),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff401e50),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4c3e51),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff35283a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff623736),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff482121),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe1d7df),
      surfaceBright: Color(0xfffff7fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf1f8),
      surfaceContainer: Color(0xfff5ebf3),
      surfaceContainerHigh: Color(0xffefe5ed),
      surfaceContainerHighest: Color(0xffe9e0e7),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe3b7f3),
      surfaceTint: Color(0xffe3b7f3),
      onPrimary: Color(0xff442254),
      primaryContainer: Color(0xff5c396c),
      onPrimaryContainer: Color(0xfff7d8ff),
      secondary: Color(0xffd4c0d7),
      onSecondary: Color(0xff392c3e),
      secondaryContainer: Color(0xff504255),
      onSecondaryContainer: Color(0xfff1dcf4),
      tertiary: Color(0xfff5b7b5),
      onTertiary: Color(0xff4c2525),
      tertiaryContainer: Color(0xff663b3a),
      onTertiaryContainer: Color(0xffffdad8),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff161217),
      onSurface: Color(0xffe9e0e7),
      onSurfaceVariant: Color(0xffcec3cd),
      outline: Color(0xff978e97),
      outlineVariant: Color(0xff4c444d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e0e7),
      inversePrimary: Color(0xff755085),
      primaryFixed: Color(0xfff7d8ff),
      onPrimaryFixed: Color(0xff2d0b3d),
      primaryFixedDim: Color(0xffe3b7f3),
      onPrimaryFixedVariant: Color(0xff5c396c),
      secondaryFixed: Color(0xfff1dcf4),
      onSecondaryFixed: Color(0xff231728),
      secondaryFixedDim: Color(0xffd4c0d7),
      onSecondaryFixedVariant: Color(0xff504255),
      tertiaryFixed: Color(0xffffdad8),
      onTertiaryFixed: Color(0xff331111),
      tertiaryFixedDim: Color(0xfff5b7b5),
      onTertiaryFixedVariant: Color(0xff663b3a),
      surfaceDim: Color(0xff161217),
      surfaceBright: Color(0xff3d373d),
      surfaceContainerLowest: Color(0xff110d12),
      surfaceContainerLow: Color(0xff1e1a1f),
      surfaceContainer: Color(0xff231e23),
      surfaceContainerHigh: Color(0xff2d282e),
      surfaceContainerHighest: Color(0xff383339),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe8bbf8),
      surfaceTint: Color(0xffe3b7f3),
      onPrimary: Color(0xff270537),
      primaryContainer: Color(0xffab82bb),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd8c4dc),
      onSecondary: Color(0xff1e1222),
      secondaryContainer: Color(0xff9d8ba1),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff9bbba),
      onTertiary: Color(0xff2c0b0c),
      tertiaryContainer: Color(0xffba8381),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff161217),
      onSurface: Color(0xfffff9fb),
      onSurfaceVariant: Color(0xffd2c7d2),
      outline: Color(0xffaaa0aa),
      outlineVariant: Color(0xff89808a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e0e7),
      inversePrimary: Color(0xff5d3a6d),
      primaryFixed: Color(0xfff7d8ff),
      onPrimaryFixed: Color(0xff210032),
      primaryFixedDim: Color(0xffe3b7f3),
      onPrimaryFixedVariant: Color(0xff4a285a),
      secondaryFixed: Color(0xfff1dcf4),
      onSecondaryFixed: Color(0xff180d1d),
      secondaryFixedDim: Color(0xffd4c0d7),
      onSecondaryFixedVariant: Color(0xff3f3144),
      tertiaryFixed: Color(0xffffdad8),
      onTertiaryFixed: Color(0xff250708),
      tertiaryFixedDim: Color(0xfff5b7b5),
      onTertiaryFixedVariant: Color(0xff532b2a),
      surfaceDim: Color(0xff161217),
      surfaceBright: Color(0xff3d373d),
      surfaceContainerLowest: Color(0xff110d12),
      surfaceContainerLow: Color(0xff1e1a1f),
      surfaceContainer: Color(0xff231e23),
      surfaceContainerHigh: Color(0xff2d282e),
      surfaceContainerHighest: Color(0xff383339),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9fb),
      surfaceTint: Color(0xffe3b7f3),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffe8bbf8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9fb),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd8c4dc),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9f9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff9bbba),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff161217),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9fb),
      outline: Color(0xffd2c7d2),
      outlineVariant: Color(0xffd2c7d2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e0e7),
      inversePrimary: Color(0xff3d1b4d),
      primaryFixed: Color(0xfff9deff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffe8bbf8),
      onPrimaryFixedVariant: Color(0xff270537),
      secondaryFixed: Color(0xfff5e0f8),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd8c4dc),
      onSecondaryFixedVariant: Color(0xff1e1222),
      tertiaryFixed: Color(0xffffe0de),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff9bbba),
      onTertiaryFixedVariant: Color(0xff2c0b0c),
      surfaceDim: Color(0xff161217),
      surfaceBright: Color(0xff3d373d),
      surfaceContainerLowest: Color(0xff110d12),
      surfaceContainerLow: Color(0xff1e1a1f),
      surfaceContainer: Color(0xff231e23),
      surfaceContainerHigh: Color(0xff2d282e),
      surfaceContainerHighest: Color(0xff383339),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
