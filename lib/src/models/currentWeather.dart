import 'package:Iweather/src/models/weatherInfo.dart';

class CurrentWeather {
  String dateTime;
  String temperature;
  String humidity;
  String clouds;
  List<WeatherInfo> weatherInfo;

  CurrentWeather(
      {this.dateTime,
      this.temperature,
      this.humidity,
      this.clouds,
      this.weatherInfo});

  factory CurrentWeather.fromJson({dynamic json}) {
    final String dateTime = json['dt'].toString();
    final String temperature = json['temp'].toString();

    final String humidity = json['humidity'].toString();
    final String clouds = json['clouds'].toString();

    // print(json['weather'].runtimeType);

    final List<dynamic> weatherInfoMap = json['weather'];

    List<WeatherInfo> weatherInfo = weatherInfoMap
        .map((dynamic data) => WeatherInfo.fromJson(json: data))
        .toList();

    print(weatherInfo[0].toJson());

    return CurrentWeather(
        dateTime: dateTime,
        temperature: temperature,
        humidity: humidity,
        clouds: clouds,
        weatherInfo: weatherInfo);
  }

  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime,
      'temperature': temperature,
      'humidity': humidity,
      'clouds': clouds,
      'weatherInfo': weatherInfo
    };
  }
}
