class WeatherInfo {
  String id;
  String main;
  String description;
  String icon;

  WeatherInfo({this.id, this.main, this.description, this.icon});

  factory WeatherInfo.fromJson({json}) {

    final String id = json['id'].toString();
    // print(id);
    final String main = json['main'].toString();
    //print(main);

    final String description = json['description'].toString();
    // print(description);
    final String icon = json['icon'].toString();
    // print(icon);

    return WeatherInfo(
        id: id, main: main, description: description, icon: icon);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'main': main, 'description': description, 'icon': icon};
  }
}
