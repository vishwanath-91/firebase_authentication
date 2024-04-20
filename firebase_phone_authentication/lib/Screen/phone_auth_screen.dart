import 'package:firebase_phone_authentication/widgets/custom_elevated_button.dart';
import 'package:firebase_phone_authentication/widgets/custom_text_widgets.dart';
import 'package:flutter/material.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const CustomTextWidgets(labelText: "Phone Authentication Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              onPressed: () {},
              child: const Text("Phone Authentication"),
            ),
          ],
        ),
      ),
    );
  }
}
