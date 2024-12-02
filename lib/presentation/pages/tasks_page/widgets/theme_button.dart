import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/presentation/theme/theme_cubit.dart';

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
            Switch(
                value: state == ThemeMode.dark,
                onChanged: (value) {
                  BlocProvider.of<ThemeCubit>(context).updateTheme(
                    value ? ThemeMode.dark : ThemeMode.light,
                  );
                }),
          ],
        );
      },
    );
  }
}
