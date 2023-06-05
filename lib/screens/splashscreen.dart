import 'package:flutter/material.dart';
import 'package:weather_app/screens/homescreen.dart';
import 'package:weather_app/services/networking.dart';

import '../services/location.dart';

const apiKey = '0c324e13be8028353f5765fc15489f22';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  dynamic latitude;
  dynamic longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    // ignore: avoid_print
    // print(weatherData);

    // Future.delayed(const Duration(seconds: 3), () {
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          locationWeather: weatherData,
        ),
      ),
    );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 65, 134).withOpacity(0.5),
      body: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
