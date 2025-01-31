import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_c13_friday/base.dart';
import 'package:todo_c13_friday/login/login_connector.dart';

class LoginViewModel extends BaseViewModel<LoginConnector> {
  Future<void> login(
    String email,
    String password,
  ) async {
    try {
      connector!.showLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      connector!.goToHome();
    } on FirebaseAuthException catch (e) {
      connector!.showError(message: e.message ?? "");
    }
  }
}
