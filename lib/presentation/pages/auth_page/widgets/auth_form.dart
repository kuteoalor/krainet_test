import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/presentation/pages/auth_page/auth_cubit.dart';
import 'package:krainet_test/presentation/pages/auth_page/auth_state.dart';
import 'package:krainet_test/presentation/pages/auth_page/widgets/auth_input_field.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_page.dart';

class AuthorizationForm extends StatefulWidget {
  final bool isRegister;
  const AuthorizationForm({
    super.key,
    required this.isRegister,
  });

  @override
  State<AuthorizationForm> createState() => _AuthorizationFormState();
}

class _AuthorizationFormState extends State<AuthorizationForm> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  bool isValidEmail = false;
  bool isValidPassword = false;
  late bool isValidConfirmPassword;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    if (widget.isRegister) {
      confirmPasswordController = TextEditingController();
      isValidConfirmPassword = false;
    } else {
      isValidConfirmPassword = true;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    if (widget.isRegister) {
      confirmPasswordController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthStateAuthorized) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const TasksPage(),
            ),
          );
        } else if (state is AuthStateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.message}'),
            ),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Card(
            color: Theme.of(context).colorScheme.surfaceContainer,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthInputField(
                    hintText: 'Email',
                    controller: emailController,
                    validator: (value) {
                      if (RegExp(
                              r"[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        setState(() {
                          isValidEmail = true;
                        });
                        return '';
                      }
                      setState(() {
                        isValidEmail = false;
                      });
                      return 'Invalid email';
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthInputField(
                    hintText: 'Password',
                    obscureText: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value.length > 3) {
                        setState(() {
                          isValidPassword = true;
                        });
                        return '';
                      }
                      setState(() {
                        isValidPassword = false;
                      });
                      return 'Weak password';
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (widget.isRegister)
                    AuthInputField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      hintText: 'Confirm your password',
                      validator: (value) {
                        if (value != passwordController.text) {
                          setState(() {
                            isValidConfirmPassword = false;
                          });
                          return 'Passwords don\'t match';
                        } else if (value.length < 4) {
                          setState(() {
                            isValidConfirmPassword = false;
                          });
                          return 'Weak password';
                        }
                        setState(() {
                          isValidConfirmPassword = true;
                        });
                        return '';
                      },
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isValidEmail &&
                              isValidPassword &&
                              isValidConfirmPassword
                          ? () {
                              if (widget.isRegister) {
                                BlocProvider.of<AuthCubit>(context).signUp(
                                  emailController.text,
                                  passwordController.text,
                                );
                              } else {
                                BlocProvider.of<AuthCubit>(context).signIn(
                                  emailController.text,
                                  passwordController.text,
                                );
                              }
                            }
                          : null,
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.primaryContainer),
                      ),
                      child: Text(
                        widget.isRegister ? 'SIGN UP' : 'SIGN IN',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
