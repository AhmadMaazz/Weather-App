import 'package:flutter/material.dart';
import 'package:weather_app/screens/splashscreen.dart';

void main() {
  // Future.delayed(const Duration(seconds: 40));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
