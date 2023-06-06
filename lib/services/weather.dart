import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = '0c324e13be8028353f5765fc15489f22';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url1 = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey&units=metric');
    var url2 = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    NetworkHelper networkHelper1 = NetworkHelper(url1);
    NetworkHelper networkHelper2 = NetworkHelper(url2);

    var weatherData1 = await networkHelper1.getData();
    var weatherData2 = await networkHelper2.getData();

    return [weatherData1, weatherData2];
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    // latitude = location.latitude;
    // longitude = location.longitude;

    var url1 = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var url2 = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    NetworkHelper networkHelper1 = NetworkHelper(url1);
    NetworkHelper networkHelper2 = NetworkHelper(url2);

    var weatherData1 = await networkHelper1.getData();
    var weatherData2 = await networkHelper2.getData();

    return [weatherData1, weatherData2];
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'assets/images/lighty.png';
    } else if (condition < 600) {
      return 'assets/images/rainy.png';
    } else if (condition < 700) {
      return 'assets/images/snowy.png';
    } else {
      return 'assets/images/sunny.png';
    }
  }
}
