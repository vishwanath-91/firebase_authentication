
import 'package:flutter/material.dart';

import 'custom_text_button.dart';
import 'custom_text_form_field.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final Widget child;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.onTap,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: CustomTextFormField(
        controller: controller,
        labelText: label,
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
      actions: <Widget>[
        CustomTextButton(
          onTap: onTap,
          child: child,
        ),
      ],
    );
  }
}
