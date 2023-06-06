import 'package:flutter/material.dart';

class DayMiniCard extends StatelessWidget {
  final int? temp;
  final String url;
  const DayMiniCard({
    Key? key,
    required this.size,
    this.temp,
    required this.url,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        // alignment: Alignment.bottomCenter,
        height: size.height * 0.233,
        width: size.width * 0.9,
        // color: Colors.white,
        decoration: BoxDecoration(
          color: const Color(0xFF3C90EA),
          borderRadius: BorderRadius.circular(50),
          // boxShadow: [
          //   BoxShadow(
          //     color: const Color.fromARGB(255, 0, 65, 134).withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: const Offset(3, 3),
          //     // changes the position of the shadow
          //   ),
          // ],
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 37, 142, 255).withOpacity(0.5),
                offset: const Offset(0, -25),
                blurRadius: 4,
                spreadRadius: -10)
          ],
        ),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0, left: 30),
                  child: Text(
                    'Day',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 214, 214, 214),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 60.0, bottom: 20),
                  child: Text(
                    'ooo',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    url,
                    scale: 3.5,
                  ),
                )
                // Text('hello'),
              ],
            ),
            // SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text(
                '$temp°',
                style: const TextStyle(
                  color: Color.fromARGB(255, 214, 214, 214),
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Swipe to see details',
                  style: TextStyle(
                    color: Color.fromARGB(255, 216, 216, 216),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
