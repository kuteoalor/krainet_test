import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/presentation/pages/auth_page/auth_cubit.dart';
import 'package:krainet_test/presentation/pages/auth_page/auth_page.dart';
import 'package:krainet_test/presentation/pages/auth_page/auth_state.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthStateInitial) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const AuthPage(),
            ),
          );
        }
      },
      child: OutlinedButton(
        onPressed: () {
          BlocProvider.of<AuthCubit>(context).signOut();
        },
        child: const Text(
          'Log out',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
