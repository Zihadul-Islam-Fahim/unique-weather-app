import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_weatherapp/controllers/weather_controller.dart';
import 'package:test_weatherapp/utility/setWeatherCode.dart';

Column currentProperties() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        SetWeatherCode.setName(
          WeatherController.currentWeatherCode,
        ).name.toString(),
        style: const TextStyle(
            fontSize: 26, fontWeight: FontWeight.w300, fontFamily: 'poppins'),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.wind_snow, color: Colors.blueAccent),
              Text(
                '${WeatherController.currentWindSpeed} m/s',
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'poppins'),
              )
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Row(
            children: [
              const Icon(
                CupertinoIcons.arrow_2_squarepath,
                color: Colors.blueAccent,
              ),
              Text(
                '${WeatherController.currentSurfacePressure.toInt()} hPa',
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'poppins'),
              ),
            ],
          )
        ],
      ),
    ],
  );
}
