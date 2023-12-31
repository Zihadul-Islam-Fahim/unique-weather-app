import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_weatherapp/controllers/weather_controller.dart';
import 'package:test_weatherapp/utility/setWeatherCode.dart';
import 'package:test_weatherapp/widgets/current_properties.dart';
import 'package:test_weatherapp/widgets/current_weather_container.dart';
import 'package:test_weatherapp/widgets/temp_column.dart';

SizedBox todayDetailSizebox(Size size) {
  return SizedBox(
    height: size.width * 0.89,
    width: size.width,
    child: Stack(
      children: [
        Positioned(
          top: 15,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${WeatherController.district!.replaceAll("District", '')}${WeatherController.division!.replaceAll('Division', '')}",
                style: TextStyle(
                    color: WeatherController.currentIsDay == true
                        ? Colors.black
                        : Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins'),
              ),
              Text(
                '${WeatherController.country}',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'poppins',
                  color: WeatherController.currentIsDay == true
                      ? Colors.black
                      : Colors.white,
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 88,
          left: 20,
          child: Text(
            DateFormat('E, d MMMM').format(DateTime.now()),
            style: TextStyle(
                color: WeatherController.currentIsDay == true
                    ? Colors.black54
                    : Colors.white70,
                fontSize: 17,
                fontWeight: FontWeight.w300,
                fontFamily: 'poppins'),
          ),
        ),
        Positioned(
          top: 110,
          child: currentWeatherContainer(size),
        ),
        Positioned(
          top: 65,
          left: 190,
          child: Image.asset(
            'assets/' +
                SetWeatherCode.setName(WeatherController.currentWeatherCode)
                    .path +
                '.png',
            width: size.width * 0.47,
          ),
        ),
        Positioned(top: 255, left: 165, child: currentProperties()),
        Positioned(top: 172, left: 28, child: temparatureColumn()),
      ],
    ),
  );
}
