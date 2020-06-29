import 'package:Iweather/src/models/location.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  final Location location;

  MapPage({Key key, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.fullName),
      ),
      body: Center(
          child:
              Text(this.location.latitude + " --- " + this.location.longitude)),
    );
  }
}
