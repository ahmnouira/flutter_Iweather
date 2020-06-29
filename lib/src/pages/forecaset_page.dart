import 'package:Iweather/src/models/location.dart';
import 'package:flutter/material.dart';

class ForecastPage extends StatelessWidget {
  final Location location;

  ForecastPage({this.location});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(location.continent));
  }
}
