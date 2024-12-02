import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krainet_test/presentation/theme/theme.dart';
import 'package:krainet_test/presentation/theme/theme_cubit.dart';

TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme =
      GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}

ThemeData getTheme(ThemeMode themeMode, BuildContext context) {
  TextTheme textTheme = createTextTheme(context, "Inter", "Inter");
  MaterialTheme theme = MaterialTheme(textTheme);
  switch (themeMode) {
    case ThemeMode.system:
      final brightness = View.of(context).platformDispatcher.platformBrightness;
      switch (brightness) {
        case Brightness.light:
          BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.light);
          return theme.light();
        case Brightness.dark:
          BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.dark);
          return theme.light();
      }

    case ThemeMode.light:
      return theme.light();

    case ThemeMode.dark:
      return theme.dark();
  }
}
