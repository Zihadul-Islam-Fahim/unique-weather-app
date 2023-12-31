import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:test_weatherapp/controllers/data_store_controller.dart';
import 'package:test_weatherapp/controllers/weather_controller.dart';
import 'package:test_weatherapp/ui/home.dart';

class GMap extends StatefulWidget {
  const GMap({super.key});

  @override
  State<GMap> createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  late GoogleMapController googleMapController;
  Location location = Location();
  LocationData? locationData;

  Future<LocationData?> getLocation() async {
    locationData = await location.getLocation();
    return locationData;
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getLocation(),
          builder:
              (BuildContext context, AsyncSnapshot<LocationData?> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Stack(
                children: [
                  GoogleMap(
                    onTap: (latLng) {
                      WeatherController.getLocationDetails(
                          latLng.latitude, latLng.longitude, context);
                      WeatherController.setLatlong(latLng);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                      setState(() {});
                    },
                    onMapCreated: (controller) {
                      googleMapController = controller;
                      DataController.writeData('lat', snapshot.data!.latitude!);
                      DataController.writeData(
                          'lon', snapshot.data!.longitude!);
                      WeatherController.setInitialData();
                    },
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    initialCameraPosition: CameraPosition(
                      zoom: 10,
                      tilt: 5,
                      bearing: 7,
                      target:
                          LatLng(WeatherController.lat, WeatherController.lon),
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId('initial'),
                        position: LatLng(
                            WeatherController.lat, WeatherController.lon),
                      )
                    },
                  ),
                  Positioned(
                    top: 30,
                    left: 50,
                    child: Container(
                      height: 70,
                      width: 300,
                      color: Colors.white.withOpacity(0.7),
                      child: const Center(
                        child: Text(
                          "Select any Location to \ncheck weather of there.",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontFamily: 'poppins'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 169.9,
                    bottom: 26,
                    child: Card(
                      color: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          googleMapController.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                zoom: 10,
                                target: LatLng(snapshot.data!.latitude!,
                                    snapshot.data!.longitude!),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.my_location_outlined,
                          size: 30,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
