import 'package:flutter/cupertino.dart';

enum AuthStateType {
  signIn,
  signup,
}

class AuthProviders with ChangeNotifier {
  bool _authState = false;

  bool get authState => _authState;

  authStateChange() {
    _authState == false ? _authState = true : _authState = false;
    notifyListeners();
    _authState == false ? AuthStateType.signup : AuthStateType.signIn;
  }

  authentications() {}
}
