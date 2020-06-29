import 'package:Iweather/src/models/location.dart';
import 'package:flutter/material.dart';

class SilverAppBarWidget extends StatelessWidget {
  final Location location;

  SilverAppBarWidget({this.location});

  @override
  Widget build(BuildContext context) {
    print(location.toJson());

    return SliverAppBar(
      backgroundColor: Colors.blueGrey,
      forceElevated: true,
      elevation: 5.0,
      expandedHeight: MediaQuery.of(context).size.height / 2.5,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 25.0),
            child: Column(
              children: [
                // change colors depends on weather status
                Text(
                  'dsdsdsdsds',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text('25°',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                Text('London',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            )),
        background: Image(
          image: AssetImage('assets/images/cover/thunder.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
