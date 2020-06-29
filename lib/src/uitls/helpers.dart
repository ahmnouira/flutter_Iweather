import 'package:Iweather/src/models/dailyWeather.dart';

DateTime convertToDatTime(double time) {
  return DateTime.fromMillisecondsSinceEpoch(time.toInt());
}



Map<String, String> getDailyInfo(List<DailyWeather> dailyWeather, int index) {
  String temprature = double.parse(dailyWeather[index].maxTemp).toString(); // +
  // double.parse(dailyWeather[index].minTemp)) /
  //2)
  // .toString();

  String description = dailyWeather[index].weatherInfo[0].description;
  String icon = dailyWeather[index].weatherInfo[0].icon;
  String dataTime =
      convertToDatTime(double.parse(dailyWeather[index].dt)).toString();

  String humidity = dailyWeather[index].humidity;
  String main = dailyWeather[index].weatherInfo[0].main;

  return {
    'temperature': temprature,
    'description': description,
    'icon': icon,
    'dataTime': dataTime,
    'humidity': humidity,
    'main': main
  };
}
