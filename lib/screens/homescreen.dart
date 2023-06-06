// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:weather_app/screens/searchscreen.dart';
import 'package:weather_app/widgets/day_minicard.dart';

import '../services/weather.dart';
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
  WeatherModel weatherModel = WeatherModel();
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
  String imgUrl = '';

  void updateUI(dynamic weatherData1, dynamic weatherData2) {
    setState(() {
      if (weatherData1 == null || weatherData2 == null) {
        tempDay = 404;
        humidityDay = 404;
        windDay = 404;
        pressureDay = 404;
        tempNight = 404;
        humidityNight = 404;
        windNight = 404;
        pressureNight = 404;
        cityName = 'Error';

        return;
      }
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
      var condition = weatherData2['weather'][0]['id'];
      // print(condition);
      imgUrl = weatherModel.getWeatherIcon(condition);
      // print(imgUrl);
    });
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
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.black,
        title: const Text(
          'Weatherly',
          style: TextStyle(
            fontFamily: 'Banabo.ttf',
            // fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromARGB(255, 219, 219, 219),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            var weatherDataT1 = await weatherModel.getLocationWeather();
            var weatherData1 = weatherDataT1[0];
            var weatherData2 = weatherDataT1[1];
            updateUI(weatherData1, weatherData2);
          },
          icon: const Icon(Icons.my_location),
          splashRadius: 15,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var typedName = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CityScreen(),
                ),
              );
              // print(typedName);
              if (typedName != null) {
                var weatherDataT1 =
                    await weatherModel.getCityWeather(typedName);
                var weatherData1 = weatherDataT1[0];
                var weatherData2 = weatherDataT1[1];
                updateUI(weatherData1, weatherData2);
              }
            },
            icon: const Icon(Icons.location_searching),
            splashRadius: 15,
          ),
        ],
      ),
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 1.0),
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
                          Color.fromARGB(255, 34, 36, 41), // Lightest color
                          Color.fromARGB(255, 0, 0, 0), // Darkest color
                        ],
                        stops: [0.0, 1.0], // Adjust the stops if needed
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: isSecondOrder
                        ? Column(
                            children: [
                              // SizedBox(height: size.height * 0.03),
                              DayMiniCard(
                                url: imgUrl,
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
                                url: imgUrl,
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
                ),
                // DayCard(size: size),
                // NightMiniCard(size: size),

                // DayMiniCard(size: size),
                // NightCard(size: size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

      // var temperature = decodedData['main']['temp'];
      // var condition = decodedData['weather'][0]['id'];
      // var cityName = decodedData['name'];