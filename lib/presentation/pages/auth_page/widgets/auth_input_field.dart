import 'package:flutter/material.dart';

class AuthInputField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final Function(String) validator;
  final TextEditingController controller;
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
  String errorText = '';
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        errorText: errorText,
      ),
      onChanged: (value) {
        setState(() {
          errorText = widget.validator(value);
        });
      },
    );
  }
}
