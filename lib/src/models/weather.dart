import 'package:Iweather/src/models/currentWeather.dart';
import 'package:Iweather/src/models/dailyWeather.dart';

class Weather {
  CurrentWeather currentWeather;
  List<DailyWeather> dailyWeather;

  Weather({this.currentWeather, this.dailyWeather});

  factory Weather.fromJson({json}) {
    final CurrentWeather currentWeather =
        CurrentWeather.fromJson(json: json['current']);

    final List<dynamic> dailyWeatherMap = json['daily'];

    List<DailyWeather> dailyWeather = dailyWeatherMap
        .map((dynamic data) => DailyWeather.fromJson(json: data))
        .toList();

    return Weather(currentWeather: currentWeather, dailyWeather: dailyWeather);
  }

  Map<String, dynamic> toJson() {
    return {'currentWeather': currentWeather, 'dailyWeather': dailyWeather};
  }
}
