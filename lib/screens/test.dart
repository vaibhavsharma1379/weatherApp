import 'package:flutter/material.dart';
import 'package:weatherhub/services/location.dart';
import 'package:geolocator/geolocator.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.Longitude);
    print(location.Longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(""
          "fuck u"),
    );
  }
}
