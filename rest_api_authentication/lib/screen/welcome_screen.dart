import 'package:flutter/material.dart';
import 'package:rest_api_authentication/custom_widgets/custom_elevated_button.dart';

class WelComeScreen extends StatelessWidget {
  const WelComeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "welcome to api authentication app",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              text: "Start",
              onPressed: () => Navigator.pushNamed(context, "/api_auth_screen"),
            ),
          ],
        ),
      ),
    );
  }
}
