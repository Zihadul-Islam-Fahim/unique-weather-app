import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_weatherapp/controllers/weather_controller.dart';
import 'package:test_weatherapp/utility/utility_file.dart';

class DataController{

  static writeData(key,value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setDouble(key, value);
  }

  static Future<double> readData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    double? v =  sharedPreferences.getDouble(key);
    return v!;
  }

  static setData(data){

    WeatherController.hourlyTemp = data['hourly']["temperature_2m"];
    WeatherController.currentTemp = data['current']['temperature_2m'];
    WeatherController.currentWeatherCode = data['current']['weather_code'];
    WeatherController.currentSurfacePressure = data['current']['surface_pressure'];
    WeatherController.currentWindSpeed = data['current']['wind_speed_10m'];
    WeatherController.currentIsDay = Utility.convertBinaryToBool(data['current']['is_day']);
    WeatherController.hourlyTemp = data['hourly']['temperature_2m'];
    WeatherController.hourlyTime = data['hourly']['time'];
    WeatherController.hourlyWeatherCode = data['hourly']['weather_code'];
    WeatherController.dailyTime = data['daily']['time'];
    WeatherController.dailyWeatherCode = data['daily']['weather_code'];
    WeatherController.dailyMaxTemp = data['daily']['temperature_2m_max'];
    WeatherController.dailyMinTemp = data['daily']['temperature_2m_min'];
    WeatherController.dailyDayLight = data['daily']['daylight_duration'];

  }

}