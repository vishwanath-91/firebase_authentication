import 'package:flutter/material.dart';
import 'package:rest_api_authentication/custom_colors/custom_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double elevation;
  final EdgeInsetsGeometry padding;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.elevation = 4.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: CustomColors.buttonTextColor,
        backgroundColor: CustomColors.buttonColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Padding(
        padding: padding,
        child: Text(text),
      ),
    );
  }
}
