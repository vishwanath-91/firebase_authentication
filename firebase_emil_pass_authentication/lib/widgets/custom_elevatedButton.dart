import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function()? onTap;

  const CustomElevatedButton({
    super.key,
    required this.iconData,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(
        iconData,
        color: Colors.white,
      ),
      label: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.deepPurpleAccent),
      ),
    );
  }
}
