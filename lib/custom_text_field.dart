import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon; // Agora é opcional

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.onSaved,
    this.validator,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.blue.shade900, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.blue.shade900, width: 2.0),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
