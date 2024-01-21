import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomTextForm(
      {super.key,
      required this.hinttext,
      required this.mycontroller,
      this.validator,
      required this.keyboardType,
      this.suffixIcon,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: mycontroller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hinttext,
          suffixIcon: suffixIcon,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: Colors.grey,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: Colors.grey,
              ))),
    );
  }
}
