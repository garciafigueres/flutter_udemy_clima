import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '4abfdced52f079a68f7b6b8a0d3f7884';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL'
        '?q=$cityName'
        '&appid=$apiKey'
        '&units=metric';

    NetworkHelper networkHelper = new NetworkHelper(url);

    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    var url = '$openWeatherMapURL'
        '?lat=${location.latitude}'
        '&lon=${location.longitude}'
        '&appid=$apiKey'
        '&units=metric';

    NetworkHelper networkHelper = new NetworkHelper(url);

    return await networkHelper.getData();
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
      return 'bon oratge per a un 🍦!';
    } else if (temp > 20) {
      return 'hora de ficar-se de curt 👕!';
    } else if (temp < 10) {
      return 'vas a necessitar 🧣 i 🧤';
    } else {
      return 'tingues a mà un 🧥, per si acàs...';
    }
  }
}
