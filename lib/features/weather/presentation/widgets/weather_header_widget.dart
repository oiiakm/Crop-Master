import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WeatherHeaderWidget extends StatelessWidget {
  const WeatherHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = Get.width;
    double screenHeight = Get.height;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 83, 54, 212),
      ),
    );

    return SizedBox(
      width: screenWidth,
      height: screenHeight / 8,
      child: Stack(
        children: [
          Container(
            width: screenWidth,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 83, 54, 212),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 20,
                  offset: Offset(0, 4),
                  spreadRadius: 4,
                ),
              ],
            ),
          ),
          const Positioned(
            left: 16,
            top: 75,
            child: Text(
              'Weather Information',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
