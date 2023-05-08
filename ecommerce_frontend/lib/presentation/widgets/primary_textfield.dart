import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final Icon? prefixIcon;

  const PrimaryTextField({super.key, required this.labelText, this.controller,this.obscureText=false,this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: labelText,
          
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),),prefixIcon: prefixIcon),
    );
  }
}
