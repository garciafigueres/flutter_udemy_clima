class WeatherModel {
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
