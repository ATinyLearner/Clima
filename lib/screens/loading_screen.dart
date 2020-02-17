import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import '../screens/location_screen.dart';

const apiKey = '3c01c797e5fc61f08789cf5a687c1c2f';
double lat;
double lon;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    lon = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://samples.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
