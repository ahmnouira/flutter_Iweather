import 'package:Iweather/src/models/currentWeather.dart';
import 'package:Iweather/src/models/dailyWeather.dart';
import 'package:Iweather/src/models/location.dart';
import 'package:Iweather/src/models/weather.dart';
import 'package:Iweather/src/models/weatherInfo.dart';
import 'package:Iweather/src/uitls/helpers.dart';
import 'package:flutter/material.dart';
// import 'package:Iweather/src/widgets/silver_app_bar_widget.dart';
// import 'package:Iweather/src/widgets/silver_list.dart';
// import 'package:Iweather/src/widgets/silver_grid_widget.dart';

class WeatherPage extends StatelessWidget {
  final Location location;
  final Weather weather;

  WeatherPage({Key key, this.location, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrentWeather currentWeather = weather.currentWeather;
    WeatherInfo weatherInfo =
        currentWeather.weatherInfo[0]; // 0: primay condition

    List<DailyWeather> dailyWeather =
        weather.dailyWeather.sublist(1); //the next 6 days

    // print(location.toJson());
    String temperature = currentWeather.temperature;
    String humidty = currentWeather.humidity;
    String main = weatherInfo.main;
    String description = weatherInfo.description;

    String iconUrl = "http://openweathermap.org/img/w/";

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.blueGrey,
          forceElevated: true,
          elevation: 5.0,
          expandedHeight: MediaQuery.of(context).size.height / 2.5,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 35.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            // change colors depends on weather status
                            Text(
                              location.fullName,
                              style: TextStyle(
                                fontSize: location.fullName.length > 25
                                    ? 12
                                    : location.fullName.length > 35 ? 8 : 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(temperature + "°  " + humidty + "%",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            Text(
                                main +
                                    '  ' +
                                    description[0].toUpperCase() +
                                    description.substring(1),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ],
                        )
                      ],
                    )
                  ],
                )),
            background: Image(
              image: AssetImage('assets/images/cover/thunder.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate(List.generate(3, (int index) {
          return ListTile(
              leading:
                  Image(image: AssetImage('assets/images/icons/thunder-2.png')),
              title: Text(
                '81° Clear ${index + 1}',
                style: TextStyle(color: Colors.black87),
              ),
              subtitle: Text(
                '${location.fullName}${index + 1}',
                style: TextStyle(color: Colors.grey),
              ));
        }))),
        SliverSafeArea(
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  Map<String, String> dayInfo =
                      getDailyInfo(dailyWeather, index);
                  print(dayInfo);
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '2020/03/12',
                          style:
                              TextStyle(fontSize: 8, color: Colors.blue[300]),
                        ),
                        Image(
                          image:
                              NetworkImage(iconUrl + dayInfo['icon'] + ".png"),
                        ),
                        Divider(),
                        Text(
                          dayInfo['temperature'] + "°",
                        ),
                      ],
                    ),
                  );
                }, childCount: dailyWeather.length - 1),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3)))
      ],
    );
  }
}
