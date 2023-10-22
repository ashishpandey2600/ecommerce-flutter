import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;

  const PrimaryTextField({super.key, required this.labelText, this.controller,this.obscureText=false,this.prefixIcon, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator:  validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: labelText,
          
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),),prefixIcon: prefixIcon),
    );
  }
}
