import 'package:flutter/material.dart';
import 'package:todo_c13_friday/firebase/firebase_manager.dart';
import 'package:todo_c13_friday/screens/login_screen.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.pink,
        width: 60,
        alignment: Alignment.center,
        height: 60,
        child: InkWell(
            onTap: () {
              FirebaseManager.logOUt().then((_) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginScreen.routeName,
                  (route) => false,
                );
              });
            },
            child: Text("Logout")),
      ),
    );
  }
}
