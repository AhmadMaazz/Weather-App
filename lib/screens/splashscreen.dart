import 'package:flutter/material.dart';
import 'package:weather_app/screens/homescreen.dart';

import '../services/location.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : const Color.fromARGB(255, 0, 65, 134).withOpacity(0.5),
      body: const Center(
        child: 
            CircularProgressIndicator(color: Colors.white),
          
        ),
      
    );
  }
}
