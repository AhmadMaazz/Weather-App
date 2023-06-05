// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:weather_app/widgets/day_minicard.dart';

import '../widgets/day_card.dart';
import '../widgets/night_card.dart';
import '../widgets/night_minicard.dart';

class HomeScreen extends StatefulWidget {
  final locationWeather1;
  final locationWeather2;
  const HomeScreen({Key? key, this.locationWeather1, this.locationWeather2})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather1, widget.locationWeather2);
  }

  // PageController _pageController = PageController(initialPage: 0);
  bool isSecondOrder = false;
  int? tempDay;
  int? tempNight;
  int? humidityDay;
  int? humidityNight;
  int? windDay;
  int? windNight;
  int? pressureDay;
  int? pressureNight;
  String? cityName;

  void updateUI(dynamic weatherData1, dynamic weatherData2) {
    double tempDays = weatherData1['list'][5]['main']['temp'];
    tempDay = tempDays.toInt();
    humidityDay = weatherData1['list'][5]['main']['humidity'];
    double windDays = weatherData1['list'][5]['wind']['speed'];
    windDay = windDays.toInt();
    pressureDay = weatherData1['list'][5]['main']['pressure'];

    double tempNights = weatherData1['list'][0]['main']['temp'];
    tempNight = tempNights.toInt();
    humidityNight = weatherData1['list'][0]['main']['humidity'];
    double windNights = weatherData1['list'][0]['wind']['speed'];
    windNight = windNights.toInt();
    pressureNight = weatherData1['list'][0]['main']['pressure'];

    cityName = weatherData2['name'];
    // double temp = weatherData['main']['temp'];
    // temperature = temp.toInt();
    // condition = weatherData['weather'][0]['id'];
    // cityName = weatherData['name'];

    // print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: GestureDetector(
          onVerticalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              // Swiped downwards
              setState(() {
                isSecondOrder = false;
              });
            } else if (details.primaryVelocity! < 0) {
              //Swiped Upwards
              setState(() {
                isSecondOrder = true;
              });
            }
          },
          child: Stack(
            children: [
              // SizedBox(height: size.height * 0.08),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: size.height * 1,
                  // color: Colors.pink,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 41, 44, 53),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(255, 41, 44, 53), // Lightest color
                        Color.fromARGB(255, 0, 0, 0), // Darkest color
                      ],
                      stops: [0.0, 1.0], // Adjust the stops if needed
                    ),
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: isSecondOrder
                    ? Column(
                        children: [
                          // SizedBox(height: size.height * 0.03),
                          DayMiniCard(
                            size: size,
                            temp: tempDay,
                          ),
                          SizedBox(height: size.height * 0.03),
                          NightCard(
                            size: size,
                            temp: tempNight,
                            humidity: humidityNight,
                            wind: windNight,
                            pressure: pressureNight,
                            cityName: cityName,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          // SizedBox(height: size.height * 0.03),
                          DayCard(
                            size: size,
                            temp: tempDay,
                            humidity: humidityDay,
                            wind: windDay,
                            pressure: pressureDay,
                            cityName: cityName,
                          ),
                          SizedBox(height: size.height * 0.03),
                          NightMiniCard(
                            size: size,
                            temp: tempNight,
                          ),
                        ],
                      ),
              ),
              // DayCard(size: size),
              // NightMiniCard(size: size),

              // DayMiniCard(size: size),
              // NightCard(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

      // var temperature = decodedData['main']['temp'];
      // var condition = decodedData['weather'][0]['id'];
      // var cityName = decodedData['name'];