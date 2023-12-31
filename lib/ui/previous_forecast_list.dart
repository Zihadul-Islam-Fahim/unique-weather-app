import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_weatherapp/controllers/weather_controller.dart';
import 'package:test_weatherapp/utility/app_colors.dart';
import 'package:test_weatherapp/utility/setWeatherCode.dart';
import 'package:test_weatherapp/utility/time_convert.dart';

class PreviousForecastList extends StatefulWidget {
  const PreviousForecastList({super.key});

  @override
  State<PreviousForecastList> createState() => _PreviousForecastListState();
}

class _PreviousForecastListState extends State<PreviousForecastList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: WeatherController.currentIsDay == true
            ? Colors.lightBlueAccent
            : Colors.indigoAccent,
        title: const Text(
          'Previous Forecast',
          style: TextStyle(fontFamily: 'poppins'),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: WeatherController.dailyTime.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 17, top: 10, right: 17),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            height: size.height * 0.15,
            width: size.width,
            decoration: BoxDecoration(
              border: Border.all(
                  color: AppColors.secondaryColor.withOpacity(0.6), width: 2),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('d MMM').format(
                      convertDateTime(WeatherController.dailyTime[index])),
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'poppins'),
                ),
                Image.asset(
                  '${'assets/' + SetWeatherCode.setName(WeatherController.dailyWeatherCode[index]).path}.png',
                  width: size.width * 0.15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Daylight : ${WeatherController.dailyDayLight[index] ~/ 3600} Hr",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.grey,
                          fontFamily: 'poppins'),
                    ),
                    Text(
                      "Max ${WeatherController.dailyMaxTemp[index].toInt()}°",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.grey,
                          fontFamily: 'poppins'),
                    ),
                    Text(
                        'Min ${WeatherController.dailyMinTemp[index].toInt()}°',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey,
                            fontFamily: 'poppins')),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
