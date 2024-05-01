
import 'package:flutter/material.dart';

import '../Utils/custom_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? color;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius = 26.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(CustomColors.secondaryColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
        foregroundColor:
            MaterialStateProperty.all<Color>(CustomColors.buttonTextColor),
      ),
      child: child,
    );
  }
}
