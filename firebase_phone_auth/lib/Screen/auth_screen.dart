
import 'package:flutter/material.dart';

import '../Widgets/custom_elevated_button.dart';

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
