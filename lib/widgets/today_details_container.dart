import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_weatherapp/controllers/weather_controller.dart';
import 'package:test_weatherapp/utility/time_convert.dart';
import 'package:test_weatherapp/utility/setWeatherCode.dart';

Container todayDetailsContainer(Size size) {
  return Container(
    height: size.height * 0.19,
    width: size.width,
    margin: EdgeInsets.only(
      left: 19,
      right: 19,
      bottom: size.height * 0.015,
    ),
    padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 7),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(.5),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Today",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'poppins'),
            ),
            Text(
              DateFormat('MMMM, d').format(DateTime.now()),
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'poppins'),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 24,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Container(
                height: size.height * 0.2,
                padding: const EdgeInsets.only(right: 15),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${WeatherController.hourlyTemp[i]}°',
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                            fontFamily: 'poppins'),
                      ),
                      Image.asset(
                        '${'assets/' + SetWeatherCode.setName(WeatherController.hourlyWeatherCode[i]).path}.png',
                        width: size.width * 0.14,
                      ),
                      Text(
                        DateFormat.jm().format(
                            convertDateTime(WeatherController.hourlyTime[i])),
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            fontFamily: 'poppins'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
