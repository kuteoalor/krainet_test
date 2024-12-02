import 'package:flutter/material.dart';
import 'package:krainet_test/presentation/pages/auth_page/widgets/auth_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Login',
              ),
              Tab(
                text: 'Register',
              ),
            ],
          ),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TabBarView(children: [
              AuthorizationForm(isRegister: false),
              AuthorizationForm(isRegister: true),
            ]),
          ),
        ),
      ),
    );
  }
}
