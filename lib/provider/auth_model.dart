import 'package:flutter/material.dart';

enum AuthState {
  AuthOk, UnAuth,
}

class AuthModel with ChangeNotifier {
  AuthState authState = AuthState.UnAuth;

  void setAuthState(AuthState state) {
    this.authState = state;

    notifyListeners();
  }
}