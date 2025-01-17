import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_c13_friday/firebase/firebase_manager.dart';
import 'package:todo_c13_friday/models/userModel.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  User? currentUser;

  UserProvider() {
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      initUser();
    }
  }

  initUser() async {
    currentUser = FirebaseAuth.instance.currentUser;
    userModel = await FirebaseManager.readUserData(currentUser!.uid);
    notifyListeners();
  }
}
