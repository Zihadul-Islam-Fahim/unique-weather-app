import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:test_weatherapp/controllers/data_store_controller.dart';

class WeatherController {

  static String? district ="";
  static String? division ='Dhaka';
  static String? country ='Bangladesh';

  static double currentTemp = 00;
  static int currentWeatherCode = 0;
  static double currentSurfacePressure = 0.00;
  static double currentWindSpeed = 0.00;
  static bool currentIsDay = true;
  static List hourlyTemp = [];
  static List hourlyWeatherCode = [];
  static List hourlyTime = [];
  static List dailyMaxTemp = [];
  static List dailyTime = [];
  static List dailyWeatherCode = [];
  static List dailyMinTemp = [];
  static List dailyDayLight = [] ;

  static double lat =  23.81142987470769 ;
  static double lon = 90.41848346271706;

  static setInitialData() async{
    lat = await DataController.readData('lat');
    lon = await DataController.readData('lon');
  }

  static setLatlong(LatLng latLng){
    lat = latLng.latitude;
    lon = latLng.longitude;
    getWeatherData();
  }

  static Future<Response> getWeatherData() async {
    String url =
        "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,is_day,weather_code,surface_pressure,wind_speed_10m&hourly=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset,daylight_duration&wind_speed_unit=ms&precipitation_unit=inch&timeformat=unixtime&timezone=auto&past_days=30&forecast_days";
    return await get(Uri.parse(url));
  }

  static Future<void> getLocationDetails(double latitude, double longitude,context) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark currentPlace = placemarks[0];
        district = currentPlace.subAdministrativeArea.toString() == ""? "" : "${currentPlace.subAdministrativeArea.toString()},";
        division = currentPlace.administrativeArea.toString();
        country = currentPlace.country.toString();
      } else {
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Location not found")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
