import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Utils/keys.dart';
import '../Widgets/custom_show_dialog.dart';
import '../Widgets/custom_text_widgets.dart';

class PhoneAuthProvider extends ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  verifyPhoneNumberFunction(BuildContext context) {
    try {
      firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumberController.text,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential authCredential) {
          Keys.globalKey.currentState!.showSnackBar(
            const SnackBar(
              content: CustomTextWidgets(
                labelText: 'verification completed',
              ),
            ),
          );
        },
        verificationFailed: (FirebaseAuthException firebaseAuthException) {
          Keys.globalKey.currentState!.showSnackBar(
            const SnackBar(
              content: CustomTextWidgets(
                labelText: "verification failed",
              ),
            ),
          );
        },
        codeSent: (String? verId, int? forceCodeResend) {
          verficationId = verId;
          Keys.globalKey.currentState!.showSnackBar(
            const SnackBar(
              content: CustomTextWidgets(labelText: "code send successfully"),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String? verId) {},
      );
    } catch (error) {
      Keys.globalKey.currentState!.showSnackBar(
        SnackBar(
          content: CustomTextWidgets(
            labelText: error.toString(),
          ),
        ),
      );
    }
  }

  String? verficationId;
  TextEditingController otpController = TextEditingController();

  otpDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          title: "Enter your OTP",
          onTap: () {
            Navigator.of(context).pop();
          },
          controller: otpController,
          label: "phone number",
          hintText: "phone number",
          prefixIcon: Icons.phone,
          child: const Text("Submit"),
        );
      },
    );
  }
}
