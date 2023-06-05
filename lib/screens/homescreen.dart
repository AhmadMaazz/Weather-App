import 'package:flutter/material.dart';
import 'package:weather_app/widgets/day_minicard.dart';

import '../widgets/day_card.dart';
import '../widgets/night_card.dart';
import '../widgets/night_minicard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // PageController _pageController = PageController(initialPage: 0);
  bool isSecondOrder = false;

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
                          DayMiniCard(size: size),
                          SizedBox(height: size.height * 0.03),
                          NightCard(size: size),
                        ],
                      )
                    : Column(
                        children: [
                          DayCard(size: size),
                          SizedBox(height: size.height * 0.03),
                          NightMiniCard(size: size),
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
