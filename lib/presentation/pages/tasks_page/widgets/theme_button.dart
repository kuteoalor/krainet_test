import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/presentation/theme/theme_cubit.dart';

/// A widget that toggles between light and dark themes using a switch.
///
/// This widget uses a [BlocBuilder] to listen for changes in the current
/// theme mode from the [ThemeCubit]. It displays a switch that allows the
/// user to toggle between light and dark themes.
class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Dark theme: ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // Toggle switch to update the theme mode.
            Switch(
              value: state == ThemeMode.dark, // Checks if the theme is dark.
              onChanged: (value) {
                // Updates the theme mode in the ThemeCubit based on switch state.
                BlocProvider.of<ThemeCubit>(context).updateTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
