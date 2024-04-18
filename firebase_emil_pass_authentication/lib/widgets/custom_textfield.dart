import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.iconData,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          prefixIcon: Icon(
            iconData,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
    );
  }
}
