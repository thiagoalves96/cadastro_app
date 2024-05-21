import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final int maxLines; // Keeping maxLines as a field, but making it optional

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.onSaved,
    this.validator,
    this.suffixIcon,
    this.controller,
    this.maxLines = 1, // Default value of 1, making it optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accessing the current theme of the application
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(4.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onSaved: onSaved,
        validator: validator,
        maxLines: maxLines, // Using the maxLines field here
        decoration: InputDecoration(
          labelText: labelText,
          fillColor:
              theme.colorScheme.surface, // Using the surface color of the theme
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
                color: theme.primaryColor,
                width: 2.0), // Using the primary color of the theme
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
                color: theme.primaryColor,
                width: 2.0), // Using the primary color of the theme
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
