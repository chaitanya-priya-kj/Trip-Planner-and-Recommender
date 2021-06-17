import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/main/const.dart';
import 'package:flutter_travel_concept/main/overview.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      home: Details(),
    );
  }
}
