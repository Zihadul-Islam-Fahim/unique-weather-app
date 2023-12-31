import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controllers/weather_controller.dart';

Container currentWeatherContainer(Size size) {
  return Container(
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(16),
    height: size.width * 0.52,
    width: size.width * 0.9,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.5),
      borderRadius: BorderRadius.circular(20),
      //  boxShadow: const [BoxShadow(blurRadius: 8, spreadRadius: 2)]
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              WeatherController.currentIsDay == true
                  ? CupertinoIcons.sun_max_fill
                  : CupertinoIcons.moon_fill,
              color: Colors.yellowAccent.withOpacity(0.9),
              size: 40,
            ),
            Text(
              WeatherController.currentIsDay == true ? "Day" : "Night",
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  fontFamily: 'poppins'),
            )
          ],
        ),
      ],
    ),
  );
}
