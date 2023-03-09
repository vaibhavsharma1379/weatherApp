import 'package:flutter/material.dart';
import 'package:weatherhub/utilities/constants.dart';
import 'package:weatherhub/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int? temprature;
  String? cityname;
  String? message;
  String? weatherIcon;
  @override
  void initState() {
    super.initState();
    updatUI(widget.locationWeather);
  }

  void updatUI(dynamic locationweatherData) {
    setState(() {
      if (locationweatherData == null) {
        temprature = 0;
        weatherIcon = 'Error';
        message = 'Unable to get weather data';
        cityname = '';
        return;
      }
      double temp = locationweatherData['main']['temp'];
      temprature = temp.toInt();
      message = weather.getMessage(temp.toInt());
      int condition = locationweatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityname = locationweatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                  onPressed: () async {
                    var weatherData = await weather.getWeatherData();
                    updatUI(weatherData);
                  },
                  child: Icon(
                    Icons.near_me,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    var namecity = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CityScreen();
                        },
                      ),
                    );
                    if (cityname != null) {
                      var weatherdata =
                          await weather.getWeatherCityName(namecity);
                      updatUI(weatherdata);
                    }
                  },
                  child: Icon(
                    Icons.location_city,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      '$temprature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon  ',
                      style: kConditionTextStyle,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityname",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
