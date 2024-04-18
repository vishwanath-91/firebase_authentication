import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color? color;

  const CustomTextButton(
      {super.key, required this.title, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text(title));
  }
}
