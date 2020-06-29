import 'dart:convert';
import 'dart:io';

import 'package:Iweather/src/models/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GeolocationService {
  final String opencagedataAPI = "be8bdd0ed1dc493cbc2c5751bd2ad4cf";
  final String urlKey = "&key=";
  final String urlBase = "https://api.opencagedata.com/geocode/v1/json?q=";

  Future<Location> getGeomentry({@required String location}) async {
    final String url = urlBase + location + urlKey + opencagedataAPI;

    // print('Opencagedata API:$url');

    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final dynamic jsonResponse = json.decode(response.body);
      // [0] : maybe other places with the same name
      final dynamic locationsMap = jsonResponse['results'];

      Location location = Location.fromJson(json: locationsMap[0]);
      return location;
    } else {
      return null;
    }
  }
}
