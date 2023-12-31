

class SetWeatherCode{
  static  String pathName = "";
  static String weatherName = '';

  static  setName(code){

    switch (code) {
        case 0:
        pathName = 'clear';
        weatherName = "Clear Sky";
        return Weather(path: pathName, name: weatherName);
        case 45:
        pathName = 'heavycloud';
        weatherName= 'Fog';
        return Weather(path: pathName, name: weatherName);
        case 48:
        pathName = 'fog';
        weatherName= 'Rime fog';
        return Weather(path: pathName, name: weatherName);
        case 1:
        pathName = 'clear';
        weatherName= 'Mainly Clear';
        return Weather(path: pathName, name: weatherName);
        case 2:
        pathName = 'lightcloud';
        weatherName= 'Partly Cloudy';
        return Weather(path: pathName, name: weatherName);
        case 3:
        pathName = 'overcast1';
        weatherName= 'Overcast';
        return Weather(path: pathName, name: weatherName);
        case 51:
        pathName = 'heavyrain';
        weatherName= "Drizzle";
        return Weather(path: pathName, name: weatherName);
        case 55||51||53||56||57:
        pathName = 'lightrain';
        weatherName= "Light Rain";
        return Weather(path: pathName, name: weatherName);
        case 71:
        pathName = 'sleet';
        weatherName= "Freezing Drizzle";
        return Weather(path: pathName, name: weatherName);
        case 61||63||65||67:
        pathName = 'heavyrain';
        weatherName= "Rain";
        return Weather(path: pathName, name: weatherName);
        case 85||86:
        pathName = 'humidity';
        weatherName= 'Snow showers';
        return Weather(path: pathName, name: weatherName);
        case 66:
        pathName = 'humidity';
        weatherName= 'Freezing Rain';
        return Weather(path: pathName, name: weatherName);
        case 77||75||75:
        pathName = 'sleet';
        weatherName= "Snow Grains";
        return Weather(path: pathName, name: weatherName);
        case 80||81||82:
        pathName = 'showers';
        weatherName= 'Showers';
        return Weather(path: pathName, name: weatherName);
        case 95:
        pathName = 'thunderstorm';
        weatherName= 'Thunderstorm';
        return Weather(path: pathName, name: weatherName);
        case 96||99:
        pathName = 'heavyintensity';
        weatherName= 'Thunder & hail';
        return Weather(path: pathName, name: weatherName);


      default:
        pathName = 'showers';
        weatherName= 'Cloudy';
        return Weather(path: pathName, name: weatherName);

    }
  }
}

class Weather{
    final String path;
    final String name;
    Weather({required this.path,required this.name});
}
