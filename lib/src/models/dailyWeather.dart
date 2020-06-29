import 'package:Iweather/src/models/weatherInfo.dart';

class DailyWeather {
  String dt;
  String maxTemp;
  String minTemp;
  String humidity;
  List<WeatherInfo> weatherInfo;

  String clouds;

  DailyWeather(
      {this.dt,
      this.maxTemp,
      this.minTemp,
      this.humidity,
      this.clouds,
      this.weatherInfo});

  factory DailyWeather.fromJson({json}) {
    String dt = json['dt'].toString();
    String maxTemp = json['temp']['max'].toString();
    String minTemp = json['temp']['min'].toString();
    String humidity = json['humidity'].toString();
    String clouds = json['clouds'].toString();

    final List<dynamic> weatherInfoMap = json['weather'];

    List<WeatherInfo> weatherInfo = weatherInfoMap
        .map((dynamic data) => WeatherInfo.fromJson(json: data))
        .toList();

    return DailyWeather(
        dt: dt,
        maxTemp: maxTemp,
        minTemp: minTemp,
        clouds: clouds,
        humidity: humidity,
        weatherInfo: weatherInfo);
  }

  Map<String, dynamic> toJon() {
    return {
      'dt': dt,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'clouds': clouds,
      'humidty': humidity,
      'weatherInfo': weatherInfo
    };
  }
}
