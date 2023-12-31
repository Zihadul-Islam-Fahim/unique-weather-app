import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_weatherapp/controllers/weather_controller.dart';
import 'package:test_weatherapp/utility/app_colors.dart';
import 'package:test_weatherapp/utility/time_convert.dart';
import 'package:test_weatherapp/ui/previous_forecast_list.dart';
import 'package:test_weatherapp/utility/setWeatherCode.dart';

GestureDetector previousDetailList(Size size, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const PreviousForecastList()));
    },
    child: Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      padding: const EdgeInsets.all(10),
      height: size.width * 0.69,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Previous Forecast",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins'),
                ),
                Row(
                  children: [
                    Text(
                      "Details ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'poppins'),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: WeatherController.dailyTime.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: size.height * 0.08,
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.secondaryColor.withOpacity(0.6),
                        width: 2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat("d MMM").format(convertDateTime(
                            WeatherController.dailyTime[index])),
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            fontFamily: 'poppins'),
                      ),
                      Image.asset(
                        '${'assets/' + SetWeatherCode.setName(WeatherController.dailyWeatherCode[index]).path}.png',
                        width: size.width * 0.13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${WeatherController.dailyMaxTemp[index].toInt()}°",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'poppins'),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            ' ${WeatherController.dailyMinTemp[index].toInt()}°',
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'poppins'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
