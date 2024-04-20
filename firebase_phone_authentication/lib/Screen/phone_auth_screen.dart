import 'package:firebase_phone_authentication/Widgets/custom_elevated_button.dart';
import 'package:firebase_phone_authentication/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Phone Authentication"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                controller: controller,
                labelText: 'phone',
                hintText: 'Phone Number',
                prefixIcon: Icons.phone,
              ),
            ),
            CustomElevatedButton(onPressed: () {

            }, child:const Text('Submit'),),
          ],
        ),
      ),
    );
  }
}
