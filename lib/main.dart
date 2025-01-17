import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c13_friday/firebase/firebase_manager.dart';
import 'package:todo_c13_friday/firebase_options.dart';
import 'package:todo_c13_friday/providers/AuthProvider.dart';
import 'package:todo_c13_friday/providers/my_provider.dart';
import 'package:todo_c13_friday/screens/create_event.dart';
import 'package:todo_c13_friday/screens/home/home.dart';
import 'package:todo_c13_friday/screens/introduction_screen.dart';
import 'package:todo_c13_friday/screens/login_screen.dart';
import 'package:todo_c13_friday/screens/register_screen.dart';
import 'package:todo_c13_friday/theme/dark_theme.dart';
import 'package:todo_c13_friday/theme/light_theme.dart';
import 'package:todo_c13_friday/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await FirebaseFirestore.instance.enableNetwork();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var authProvider = Provider.of<UserProvider>(context);

    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightTheme.themeData,
      darkTheme: darkTheme.themeData,
      themeMode: provider.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: authProvider.currentUser != null
          ? HomeScreen.routeName
          : IntroductionScreen.routeName,
      routes: {
        IntroductionScreen.routeName: (context) => IntroductionScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CreateEvent.routeName: (context) => CreateEvent(),
      },
    );
  }
}
