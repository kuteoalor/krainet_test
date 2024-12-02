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
import 'package:krainet_test/presentation/theme/theme_cubit.dart';
import 'package:krainet_test/presentation/utils/theme_util.dart';

/// The root widget of the app.
///
/// This widget sets up the main app structure, including the [MaterialApp],
/// theme handling, and BlocProviders for managing state across different parts
/// of the app. It provides the app with access to various use cases and repositories
/// through the Bloc pattern.
class KrainetTestApp extends StatelessWidget {
  const KrainetTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Provides the TasksCubit, which uses the TasksUsecase and UidUsecase
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
        // Provides the ThemeCubit, which controls the app's theme
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        // Provides the AuthCubit, which manages authentication-related state
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
          // Builds the MaterialApp with the selected theme and the AuthPage as the home
          return MaterialApp(
            title: 'Flutter Demo',
            theme: getTheme(state, context),
            home: const AuthPage(),
          );
        },
      ),
    );
  }
}
