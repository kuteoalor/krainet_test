import 'package:flutter/material.dart';

/// A custom input field widget for authentication forms with validation.
///
/// This widget provides a `TextFormField` with customizable properties like
/// hint text, the ability to obscure text (for passwords), and a validator to
/// validate user input dynamically. It displays validation error messages if
/// the input is invalid.
class AuthInputField extends StatefulWidget {
  final String hintText; // The hint text to display in the input field
  final bool obscureText; // Whether to obscure the input text (for passwords)
  final Function(String) validator; // The function to validate the input
  final TextEditingController controller; // The controller for the text field

  const AuthInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    required this.validator,
  });

  @override
  State<AuthInputField> createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
  String errorText = ''; // Holds the error message if validation fails

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget
          .obscureText, // Determines if the text is hidden (for passwords)
      controller: widget.controller, // Binds the controller to the text field
      decoration: InputDecoration(
        hintText: widget.hintText, // Displays the hint text in the input field
        errorText: errorText, // Displays the validation error text
      ),
      // Calls the validator function each time the user changes the input
      onChanged: (value) {
        setState(() {
          // Updates the error text based on the validator's return value
          errorText = widget.validator(value);
        });
      },
    );
  }
}
