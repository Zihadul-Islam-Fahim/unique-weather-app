import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:test_weatherapp/controllers/data_store_controller.dart';
import 'package:test_weatherapp/controllers/weather_controller.dart';
import 'package:test_weatherapp/widgets/api_call_error_container.dart';
import 'package:test_weatherapp/widgets/home_body_container.dart';
import 'package:test_weatherapp/widgets/loading_container.dart';

import 'map.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data;

  getLocation() async {
    Location location = Location();
    LocationData? locationData;
    PermissionStatus status = await location.hasPermission();

    if (status == PermissionStatus.denied ||
        status == PermissionStatus.deniedForever) {
      await location.requestPermission();
      locationData = await location.getLocation();
      DataController.writeData('lat', locationData.latitude);
      DataController.writeData('lon', locationData.longitude);
      await WeatherController.setInitialData();
      if (mounted) {
        await WeatherController.getLocationDetails(
            locationData.latitude!, locationData.longitude!, context);
      }
      WeatherController.getWeatherData();
      setState(() {});
    } else if (WeatherController.lat == 0.0) {
      WeatherController.lat = await DataController.readData('lat');
      WeatherController.lon = await DataController.readData('lon');
      if (mounted) {
        await WeatherController.getLocationDetails(
            WeatherController.lat, WeatherController.lon, context);
      }
      WeatherController.getWeatherData();
      setState(() {});
    }
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: Align(
        heightFactor: 1.6,
        widthFactor: 1.9,
        child: FloatingActionButton(
          elevation: 19,
          backgroundColor: Colors.lightBlue.withOpacity(0.9),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const GMap()));
          },
          child: const Icon(CupertinoIcons.location, size: 30),
        ),
      ),
      body: FutureBuilder(
        future: WeatherController.getWeatherData(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return loadingContainer(size);
          } else if (snapshot.data!.statusCode == 200) {
            http.Response? response = snapshot.data;
            data = jsonDecode(response!.body);
            DataController.setData(data);
            return SafeArea(
              child: bodyContainer(size, context),
            );
          } else if (snapshot.data!.statusCode == 429) {
            return Center(
              child: apiCallErrorContainer(),
            );
          } else {
            return const SizedBox(child: Text('Null data'));
          }
        },
      ),
    );
  }
}
