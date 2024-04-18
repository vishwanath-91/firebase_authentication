import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    if (_authType == AuthType.signUp) {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text, password: passWordController.text);
    }
  }
}
