import 'package:firebase_phone_authentication/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'PhoneAuthScreen'),
              child: const Text("Phone Authentication"),
            ),
          ],
        ),
      ),
    );
  }
}
