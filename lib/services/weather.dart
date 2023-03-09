import 'location.dart';
import 'package:weatherhub/services/networking.dart';

String apikey = 'c71607a8d062543002f527580615eed9';
String url = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeatherCityName(String cityname) async {
    networkHelper networkCityweather = networkHelper(
      url: Uri.parse('$url?q=$cityname&appid=$apikey&units=metric'),
    );
    var weathercitydata = await networkCityweather.getData();
    return weathercitydata;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    networkHelper netHelper = networkHelper(
      url: Uri.parse(
          '$url?lat=${location.Latitude}&lon=${location.Longitude}&appid=$apikey&units=metric'),
    );
    var weatherData = await netHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
