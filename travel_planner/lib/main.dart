import 'homepage/homepage.dart';
import 'package:travel_planner/authorization/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'authorization/Login.dart';
import 'authorization/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        Homepage.id: (context) => Homepage(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUp.id: (context) => SignUp(),
      },
    );
  }
}
