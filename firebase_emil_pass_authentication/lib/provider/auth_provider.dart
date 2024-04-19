import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_emil_pass_authentication/keys/keys.dart';
import 'package:firebase_emil_pass_authentication/widgets/custom_textbutton.dart';
import 'package:firebase_emil_pass_authentication/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

enum AuthType {
  signUp,
  signIn,
}

class AuthProviders extends ChangeNotifier {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  AuthType _authType = AuthType.signIn;

  AuthType get authType => _authType;

  setAuthType() {
    _authType =
        _authType == AuthType.signIn ? AuthType.signUp : AuthType.signIn;
    notifyListeners();
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //email password authentication
  authenticate() async {
    UserCredential userCredential;
    try {
      if (_authType == AuthType.signUp) {
        //this code create user in firebase
        userCredential = await firebaseAuth.createUserWithEmailAndPassword(
            email: emailController.text, password: passWordController.text);

        //this code is for send email verification
        await userCredential.user!.sendEmailVerification();

        //this code is store signUp email uid username in firebasefirestore
        await firebaseFirestore
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          'uid': userCredential.user!.uid,
          'user_name': userController.text,
          'email': userCredential.user!.email,
        });
      }
      //this code is for signIn with email and password
      if (_authType == AuthType.signIn) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: emailController.text, password: passWordController.text);
      }
    } on FirebaseAuthException catch (error) {
      Keys.globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(error.code),
          backgroundColor: Colors.red,
        ),
      );
    } catch (error) {
      Keys.globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  bool? emailVerified;

  updateEmailVeriFicationState() {
    emailVerified = firebaseAuth.currentUser!.emailVerified;
    if (emailVerified == false) {
      Timer.periodic(const Duration(seconds: 3), (timer) async {
        await firebaseAuth.currentUser!.reload();

        final user = FirebaseAuth.instance.currentUser;
        if (user!.emailVerified) {
          timer.cancel();
          notifyListeners();
        }
      });
    }
  }

  //this code is for reset password
  TextEditingController resetEmailController = TextEditingController();

  resetpassword(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter your email"),
          content: CustomTextField(
              controller: resetEmailController,
              iconData: Icons.email,
              hintText: "Enter Email"),
          actions: [
            CustomTextButton(
              title: "Submit",
              onTap: () {
                final navigator = Navigator.of(context).pop();
                try {
                  firebaseAuth.sendPasswordResetEmail(
                      email: resetEmailController.text);
                  Keys.globalKey.currentState!.showSnackBar(
                    const SnackBar(
                      content: Text("Email Send Successfully"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  navigator;
                } on FirebaseAuthException catch (error) {
                  Keys.globalKey.currentState!.showSnackBar(
                    SnackBar(
                      content: Text(error.code),
                      backgroundColor: Colors.red,
                    ),
                  );
                  navigator;
                } catch (error) {
                  Keys.globalKey.currentState!.showSnackBar(
                    SnackBar(
                      content: Text(error.toString()),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                navigator;
              },
            )
          ],
        );
      },
    );
  }

  logOut() async {
    await firebaseAuth.signOut();
  }
}
