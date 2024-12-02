import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/presentation/pages/auth_page/auth_cubit.dart';
import 'package:krainet_test/presentation/pages/auth_page/auth_state.dart';
import 'package:krainet_test/presentation/pages/auth_page/widgets/auth_input_field.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_page.dart';

/// A StatefulWidget that manages user authentication form for sign in or sign up.
///
/// The form dynamically switches between the login and registration modes based on
/// the `isRegister` flag passed during initialization. It provides fields for email,
/// password, and confirm password (for registration). It also validates the input
/// and interacts with the `AuthCubit` to handle authentication actions.
class AuthorizationForm extends StatefulWidget {
  final bool
      isRegister; // Flag to determine if the form is for registration or sign-in

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
  bool isValidEmail = false; // Flag to track if email is valid
  bool isValidPassword = false; // Flag to track if password is valid
  late bool
      isValidConfirmPassword; // Flag for confirm password (only for registration)

  @override
  void initState() {
    super.initState();
    // Initialize controllers for form fields
    emailController = TextEditingController();
    passwordController = TextEditingController();

    // If it's a registration form, initialize confirm password controller
    if (widget.isRegister) {
      confirmPasswordController = TextEditingController();
      isValidConfirmPassword = false;
    } else {
      isValidConfirmPassword = true; // No confirm password for sign-in
    }
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is removed
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
        // Navigate to TasksPage upon successful login or registration
        if (state is AuthStateAuthorized) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const TasksPage(),
            ),
          );
        } else if (state is AuthStateError) {
          // Show an error message if authentication fails
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
                  // Email input field with validation
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
                  // Password input field with validation
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
                  // Confirm Password field (only shown for registration)
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
                  // Submit button for either login or register
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isValidEmail &&
                              isValidPassword &&
                              isValidConfirmPassword
                          ? () {
                              // Trigger the appropriate action based on the form mode
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
