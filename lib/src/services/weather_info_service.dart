import 'dart:convert';
import 'dart:io';
import 'package:Iweather/src/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherInfoService {
  // CORS problem for darksky API
  /*
  final String darkskyAPI = "c6a73a36b6977ff286cdd1759c37490c";
  final String darkskyBaseUrl = "https://api.forecast.io/forecast/";
  */

  final String openWeatherBaseUrl =
      "https://api.openweathermap.org/data/2.5/onecall";

  final String keyParam = "&appid=";
  final String openWeatherKey = "827f07100e6343c04d72de3053942a9f";
  final String latParam = "?lat=";
  final String lonParam = "&lon=";
  final String unitsParam = "&units=metric";
  final String exludeParam = "&exclude=hourly,minutely";

  http.Response response;

  Future<Weather> getCurrentWeather(
      {@required String longitude, @required String latitude}) async {
    final String url = openWeatherBaseUrl +
        latParam +
        latitude +
        lonParam +
        longitude +
        unitsParam +
        exludeParam +
        keyParam +
        openWeatherKey;
    // print('openWeatherAPI: ' + url);
    // if running on web to avoid cors problem
    /*
    if (kIsWeb) {
      this.response = await jsonp.fetch(
        uriGenerator: (String callback) => url,
      );
    } else {
      this.response = await http.get(url);
    }
    */
    print("URL" + url);

    this.response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final dynamic jsonResponse = json.decode(response.body);
      Weather weather = Weather.fromJson(json: jsonResponse);
      return weather;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
