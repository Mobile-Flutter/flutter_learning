//https://medium.com/swlh/working-with-geolocation-and-geocoding-in-flutter-and-integration-with-maps-16fb0bc35ede

import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'helper/FlutterTrainingHelper.dart';

class LocationServiceSample extends StatefulWidget {
  @override
  _LocationServiceSampleState createState() => _LocationServiceSampleState();
}

class _LocationServiceSampleState extends State<LocationServiceSample> {
  var _locaiton = new Location();
  String _currentLocation = "Location yet to be fetched";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
            onPressed: () {
              getLocationString().then((onValue) {
                setState(() {
                  _currentLocation = onValue;
                });
              });
            },
            child: Text("Get Location")),
        Text(_currentLocation, style: TextStyle(fontSize: 15))
      ],
    )));
  }

  getLocationString() async {
    try {
      FlutterTrainingHelper flutterTrainingHelper = new FlutterTrainingHelper();
      var location = await flutterTrainingHelper.getLocation();
      var locationstring =
          location.latitude.toString() + "  " + location.longitude.toString();
      return "Location: $locationstring";
    } catch (e) {
      return null;
    }
  }
}
