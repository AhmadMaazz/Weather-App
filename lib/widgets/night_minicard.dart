import 'package:flutter/material.dart';

class NightMiniCard extends StatelessWidget {
  final int? temp;
  const NightMiniCard({
    Key? key,
    required this.size, this.temp,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          // alignment: Alignment.bottomCenter,
          height: size.height * 0.26,
          width: size.width * 0.9,
          // color: Colors.white,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                // color: const Color.fromARGB(255, 0, 65, 134).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                // offset: const Offset(3, 3),
                // changes the position of the shadow
              ),
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
                      'Night',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 214, 214, 214),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0, bottom: 20),
                    child: Text(
                      'ooo',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/moony.png',
                    scale: 3,
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
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
