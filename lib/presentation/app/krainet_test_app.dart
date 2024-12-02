import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/data/repositories/auth_repository.dart';
import 'package:krainet_test/data/repositories/firestore_repository.dart';
import 'package:krainet_test/domain/usecases/auth_usecase.dart';
import 'package:krainet_test/domain/usecases/tasks_usecase.dart';
import 'package:krainet_test/domain/usecases/uid_usecase.dart';
import 'package:krainet_test/presentation/pages/auth_page/auth_cubit.dart';
import 'package:krainet_test/presentation/pages/auth_page/auth_page.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';
import 'package:krainet_test/presentation/theme/theme.dart';
import 'package:krainet_test/presentation/theme/theme_cubit.dart';
import 'package:krainet_test/presentation/utils/theme_util.dart';

class KrainetTestApp extends StatelessWidget {
  const KrainetTestApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksCubit(
            TasksUsecase(
              FirestoreRepository(),
            ),
            UidUsecase(
              AuthRepository(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(
            AuthUsecase(
              AuthRepository(),
            ),
          ),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: _getTheme(state, context),
            home: const AuthPage(),
          );
        },
      ),
    );
  }

  ThemeData _getTheme(ThemeMode themeMode, BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Inter", "Inter");
    MaterialTheme theme = MaterialTheme(textTheme);
    switch (themeMode) {
      case ThemeMode.system:
        final brightness =
            View.of(context).platformDispatcher.platformBrightness;
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
}
