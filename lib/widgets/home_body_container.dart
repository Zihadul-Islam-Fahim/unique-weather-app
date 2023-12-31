import 'package:flutter/material.dart';
import 'package:test_weatherapp/controllers/weather_controller.dart';
import 'package:test_weatherapp/widgets/prev_detail_list.dart';
import 'package:test_weatherapp/widgets/today_detail_sizebox.dart';
import 'package:test_weatherapp/widgets/today_details_container.dart';

Container bodyContainer(Size size, BuildContext context) {
  return Container(
    height: size.height,
    width: size.width,
    decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [

           WeatherController.currentIsDay == false ? Colors.indigoAccent.withOpacity(0.9):Colors.lightBlueAccent.withOpacity(0.9),
            WeatherController.currentIsDay == false ? Colors.indigoAccent.withOpacity(0.9):Colors.lightBlueAccent.withOpacity(0.9),

          ],
        )
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 57, child: todayDetailSizebox(size)),
        Expanded(flex: 30, child: todayDetailsContainer(size)),
        Expanded(flex: 48, child: previousDetailList(size,context)),
      ],
    ),
  );
}
