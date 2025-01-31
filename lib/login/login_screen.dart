import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_c13_friday/base.dart';
import 'package:todo_c13_friday/firebase/firebase_manager.dart';
import 'package:todo_c13_friday/login/login_connector.dart';
import 'package:todo_c13_friday/login/login_view_model.dart';
import 'package:todo_c13_friday/providers/AuthProvider.dart';
import 'package:todo_c13_friday/screens/home/home.dart';
import 'package:todo_c13_friday/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "loginScreen";

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseView<LoginScreen, LoginViewModel>
    implements LoginConnector {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector = this;
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<UserProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 150,
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: emailController,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).focusColor),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).focusColor),
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  obscuringCharacter: "#",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).focusColor),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).focusColor),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).focusColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Forget Password ?",
                  textAlign: TextAlign.end,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.login(
                        emailController.text, passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Theme.of(context).primaryColor),
                  child: Text(
                    "Login",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                  child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(children: [
                        TextSpan(
                            text: "Don’t Have Account ? ",
                            style: Theme.of(context).textTheme.titleSmall),
                        TextSpan(
                          onEnter: (event) {},
                          text: "Create Account",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18,
                                  decoration: TextDecoration.underline),
                        ),
                      ])),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 40,
                        endIndent: 10,
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      "OR",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Expanded(
                      child: Divider(
                        indent: 10,
                        thickness: 1,
                        endIndent: 40,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel initMyViewModel() {
    return LoginViewModel();
  }

  @override
  void goToHome() {

    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeScreen.routeName,
      (route) => false,
    );
  }
}
