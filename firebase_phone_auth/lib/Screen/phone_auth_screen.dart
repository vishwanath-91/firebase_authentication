import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/custom_elevated_button.dart';
import '../Widgets/custom_text_form_field.dart';
import '../provider/phone_auth_provider.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<PhoneAuthProvider>(
      builder: (BuildContext context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Phone Authentication"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  controller: value.phoneNumberController,
                  labelText: 'phone',
                  hintText: 'Phone Number',
                  prefixIcon: Icons.phone,
                ),
              ),
              CustomElevatedButton(
                onPressed: () => value.verifyPhoneNumberFunction(context),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
