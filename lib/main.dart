import 'package:flutter/material.dart';
import 'package:babysitter/screens/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: LandingScreen(),
      ),
    );
  }
}
