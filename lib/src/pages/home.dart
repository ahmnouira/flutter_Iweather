import 'package:Iweather/src/models/location.dart';
import 'package:Iweather/src/models/weather.dart';
import 'package:Iweather/src/services/current_location_service.dart';
import 'package:Iweather/src/services/geolocation_service.dart';
import 'package:Iweather/src/services/weather_info_service.dart';
import 'package:Iweather/src/uitls/helpers.dart';
import 'package:Iweather/src/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:Iweather/src/pages/forecaset_page.dart';
import 'package:Iweather/src/pages/weather_page.dart';
import 'package:Iweather/src/pages/map_page.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> listPages = List<Widget>();
  Widget _currentPage;
  int _currentIndex;

  GeolocationService geolocationService;
  WeatherInfoService weatherInfoService;
  CurrentLocationService currentLocationService;

  Weather weather;
  Location location;

  bool loading = true;

  Icon visibleIcon = Icon(Icons.search);
  Widget searchBar = Text('Iweather');

  void _handleSearch() {
    setState(() {
      if (this.visibleIcon.icon == Icons.search) {
        this.visibleIcon = Icon(Icons.cancel);
        this.searchBar = TextField(
            textInputAction: TextInputAction.search,
            autocorrect: true,
            cursorColor: Colors.white70,
            cursorRadius: Radius.circular(5),
            enableSuggestions: true,
            enableInteractiveSelection: true,
            style: TextStyle(color: Colors.white, fontSize: 24),
            onSubmitted: (String value) =>
                // print(value);
                _getDataForCity(place: value));
      } else {
        this.visibleIcon = Icon(Icons.search);
        this.searchBar = Text('IWeather');
        _getCurrentLocation();
      }
    });
  }

  Future<dynamic> _getCurrentLocation() async {
    final l = await currentLocationService.getLocation();

    location = Location(
        latitude: l.latitude.toString(),
        longitude: l.longitude.toString(),
        time: convertToDatTime(l.time),
        fullName: 'sdssd',
        continent: 'ASICA');

    weather = await weatherInfoService.getCurrentWeather(
        longitude: l.longitude.toString(), latitude: l.latitude.toString());

    listPages = <Widget>[
      WeatherPage(
        location: location,
        weather: weather,
      ),
      ForecastPage(
        location: location,
      ),
      MapPage(
        location: location,
      )
    ];

    setState(() {
      location = location;
      weather = weather;
      listPages = listPages;
      _currentPage = listPages[_currentIndex];
      loading = false;
    });
  }

  /* this when the user clicks search  */
  Future<dynamic> _getDataForCity({String place = 'Monastir'}) async {
    setState(() {
      loading = true;
    });

    location = await geolocationService.getGeomentry(location: place);

    weather = await weatherInfoService.getCurrentWeather(
        longitude: location.longitude, latitude: location.latitude);

    /* print(weather.currentWeather.toJson());
    print('-----');

    weather.dailyWeather.forEach((element) {
      print(element.toJon());
    });
*/
    listPages = <Widget>[
      WeatherPage(
        location: location,
        weather: weather,
      ),
      ForecastPage(
        location: location,
      ),
      MapPage(
        location: location,
      )
    ];

    setState(() {
      location = location;
      weather = weather;
      listPages = listPages;
      _currentPage = listPages[_currentIndex];

      loading = false;
    });
  }

  void _changePage(int selectedIndex) {
    /*
    // Map Page
    if (selectedIndex == 2) {
      this.visibleIcon = Icon(Icons.search);
      this.searchBar = Text('IWeather');
    } else {}
*/

    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = listPages[selectedIndex];
    });
  }

  @override
  void initState() {
    super.initState();

    geolocationService = GeolocationService();
    weatherInfoService = WeatherInfoService();
    currentLocationService = CurrentLocationService();

    _currentIndex = 0;

    _getCurrentLocation().then((_) => {
          // the double dots allows you to perform a sequence of a operations on the same object
          listPages
            ..add(WeatherPage(
              location: location,
              weather: weather,
            ))
            ..add(ForecastPage(location: location))
            ..add(MapPage(
              location: location,
            )),
          _currentPage = WeatherPage(
            location: location,
            weather: weather,
          )
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(
          icon: visibleIcon,
          onPressed: () => _handleSearch(),
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        )
      ], title: searchBar, elevation: 0.0),
      body: SafeArea(
        child: (loading) ? Loading(width: 2) : _currentPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: const Text('Weather')),
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_cloudy), title: const Text('Forcast')),
          BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop), title: const Text('Map'))
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }
}
