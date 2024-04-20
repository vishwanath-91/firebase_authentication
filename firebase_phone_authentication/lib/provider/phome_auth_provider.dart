import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phone_authentication/Utils/keys.dart';
import 'package:firebase_phone_authentication/Widgets/custom_text_widgets.dart';
import 'package:flutter/material.dart';

class PhoneAuthProvider extends ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  verifyPhoneNumbers() {
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
          Keys.globalKey.currentState!.showSnackBar(const SnackBar(
              content: CustomTextWidgets(
            labelText: "verification failed",
          )));
        },
        codeSent: (String? verId, int? forceCodeResend) {
          Keys.globalKey.currentState!.showSnackBar(
            const SnackBar(
              content: CustomTextWidgets(labelText: "code send successfuly"),
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
}
