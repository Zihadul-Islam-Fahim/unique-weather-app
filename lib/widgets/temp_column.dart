import 'package:flutter/material.dart';
import 'package:test_weatherapp/controllers/weather_controller.dart';

Column temparatureColumn() {
  return Column(
    children: [
      Text(
        '${WeatherController.currentTemp.toInt()}°',
        style: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 78,
        ),
      ),
      Text(
        "Max  ${WeatherController.dailyMaxTemp.last}° \nMin  ${WeatherController.dailyMinTemp.last}°",
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w300, fontFamily: 'poppins'),
      )
    ],
  );
}
