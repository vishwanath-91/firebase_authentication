import 'package:firebase_emil_pass_authentication/widgets/custom_elevatedButton.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Select Email Password Authentication"),
          CustomElevatedButton(
            iconData: Icons.email,
            title: "Email/password",
            onTap: () => Navigator.pushNamed(context, 'emailPassScreen'),
          ),
        ],
      )),
    );
  }
}
