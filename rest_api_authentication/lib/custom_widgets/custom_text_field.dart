import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rest_api_authentication/custom_colors/custom_colors.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData prefixIcon;
  final bool enabled;
  final bool autofocus;
  final ValueChanged<String> onChanged;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.obscureText = false,
    required this.prefixIcon,
    this.enabled = true,
    this.autofocus = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          labelStyle: const TextStyle(color: Colors.black),
          hintStyle: const TextStyle(color: Colors.black),
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.primaryColor),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
    );
  }
}
