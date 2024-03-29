import 'package:flutter/material.dart';

import '../screens/searchscreen.dart';

class DayCard extends StatefulWidget {
  final int? temp;
  final int? wind;
  final int? humidity;
  final int? pressure;
  final String? cityName;
  final String url;

  const DayCard({
    Key? key,
    required this.size,
    required this.temp,
    this.wind,
    this.humidity,
    this.pressure,
    this.cityName,
    required this.url,
  }) : super(key: key);

  final Size size;

  @override
  State<DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: widget.size.height * 0.56,
        width: widget.size.width * 0.9,
        decoration: BoxDecoration(
          color: const Color(0xFF53B0FB),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Day',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'ooo',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () async {
                  //     var weatherDataT1 =
                  //         await weatherModel.getLocationWeather();
                  //     var weatherData1 = weatherDataT1[0];
                  //     var weatherData2 = weatherDataT1[1];
                  //   },
                  //   icon: const Icon(Icons.place),
                  //   constraints: const BoxConstraints(),
                  //   color: Colors.white,
                  //   iconSize: 25,
                  // ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CityScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.tune),
                    constraints: const BoxConstraints(),
                    color: Colors.white,
                  ),
                  // Text('hello'),
                ],
              ),
            ),
            SizedBox(
              // color: Color(0xFF3C90EA),
              // color: Colors.red,
              width: widget.size.width,
              height: widget.size.height * 0.18,
              child: Stack(
                children: [
                  SizedBox(
                    width: widget.size.width,
                    height: widget.size.height * 0.5,
                    child: CustomPaint(
                      painter: ArcPainter(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Center(
                      child: Image.asset(
                        widget.url,
                        scale: 1.85,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: const Color(0xFF3C90EA),
              width: widget.size.width,
              height: widget.size.height * 0.17,
              child: Column(
                children: [
                  Text(
                    '${widget.temp}°',
                    style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${widget.cityName}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: Color(0xFF3C90EA),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Wind now\n',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: '  ${widget.wind}',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const TextSpan(
                                  text: 'km\\h',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Humidity\n',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${widget.humidity}',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const TextSpan(
                                  text: '%',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Pressure\n',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: '${widget.pressure}',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const TextSpan(
                                  text: 'Pa',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF3C90EA)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.6)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.05,
        size.width,
        size.height * 0.6,
      )
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
