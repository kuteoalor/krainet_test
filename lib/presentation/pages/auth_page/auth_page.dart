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
      // DefaultTabController manages tab selection for the tabs below
      length: 2, // Specifies the number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            // TabBar allows users to switch between "Login" and "Register"
            tabs: [
              Tab(
                text: 'Login', // First tab for logging in
              ),
              Tab(
                text: 'Register', // Second tab for registration
              ),
            ],
            indicatorColor: Colors.white, // Custom color for the tab indicator
            labelColor: Colors.white, // Label color for selected tab
            unselectedLabelColor:
                Colors.grey, // Label color for unselected tabs
          ),
        ),
        body: const Center(
          child: Padding(
            // Padding around the TabBarView for spacing
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TabBarView(
              // TabBarView displays the appropriate form for each tab
              children: [
                AuthorizationForm(isRegister: false), // Login form
                AuthorizationForm(isRegister: true), // Register form
              ],
            ),
          ),
        ),
      ),
    );
  }
}
