import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// A Cubit responsible for managing the theme mode (light, dark, or system) using HydratedBloc for persistence.
class ThemeCubit extends HydratedCubit<ThemeMode> {
  /// Initializes the cubit with the default theme mode set to `ThemeMode.system`.
  ThemeCubit() : super(ThemeMode.system);

  /// Updates the current theme mode.
  ///
  /// [themeMode] The new theme mode to set.
  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    // Deserialize the stored theme mode from the JSON map.
    final theme = json['themeMode'];

    switch (theme) {
      case 'ThemeMode.system':
        return ThemeMode.system;
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
    }
    return ThemeMode.system; // Default to system theme if the value is invalid.
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    // Serialize the current theme mode into a JSON map for persistence.
    return {
      'themeMode': state.toString(),
    };
  }
}
