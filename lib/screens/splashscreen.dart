import 'package:flutter/material.dart';
import 'package:weather_app/screens/homescreen.dart';
import 'package:weather_app/services/weather.dart';

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
    // Location location = Location();
    // await location.getCurrentLocation();
    // latitude = location.latitude;
    // longitude = location.longitude;

    // var url1 = Uri.parse(
    //     'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    // var url2 = Uri.parse(
    //     'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    // NetworkHelper networkHelper1 = NetworkHelper(url1);
    // NetworkHelper networkHelper2 = NetworkHelper(url2);

    // var weatherData1 = await networkHelper1.getData();
    // var weatherData2 = await networkHelper2.getData();
    // ignore: avoid_print
    // print(weatherData);

    // Future.delayed(const Duration(seconds: 3), () {
    // ignore: use_build_context_synchronously

    WeatherModel weatherModel = WeatherModel();
    var weatherDataT1 = await weatherModel.getLocationWeather();
    var weatherData1 = weatherDataT1[0];
    var weatherData2 = weatherDataT1[1];

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          locationWeather1: weatherData1,
          locationWeather2: weatherData2,
        ),
      ),
    );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 54, 97),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              scale: 2.5,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
