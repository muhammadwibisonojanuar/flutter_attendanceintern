import 'package:flutter/material.dart';
import 'package:flutter_attendanceintern/Screen/Welcome/welcome.dart';
import 'package:flutter_attendanceintern/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        scaffoldBackgroundColor: Colors.indigoAccent[100],
      ),
      home: WelcomeScreen(),
    );
  }
}