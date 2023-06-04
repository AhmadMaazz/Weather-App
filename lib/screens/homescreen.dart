import 'package:flutter/material.dart';
import 'package:weather_app/widgets/night_card.dart';

import '../widgets/day_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(height: size.height * 0.08),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.76,
                  // color: Colors.pink,
                  decoration: const BoxDecoration(
                    color: Color(0xFF3A3E4A),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
            ),
            DayCard(size: size),
            // NightCard(size: size)
          ],
        ),
      ),
    );
  }
}
