class Location {
  String fullName;
  String village;
  String state;
  String county;
  String country;
  String countryCode;
  String continent;
  String latitude;
  String longitude;
  String openstreetmapUrl;
  DateTime time;

  Location(
      {this.fullName,
      this.village,
      this.state,
      this.country,
      this.county,
      this.countryCode,
      this.continent,
      this.latitude,
      this.longitude,
      this.openstreetmapUrl,
      this.time});

  factory Location.fromJson({json}) {
    final String fullName = json['formatted'];
    final String village = json['components']['village'] == null
        ? ''
        : json['components']['village'];
    final String state =
        json['components']['state'] == null ? '' : json['components']['state'];
    final String county = json['components']['county'] == null
        ? ''
        : json['components']['county'];

    final String country = json['components']['country'];

    final String countryCode = json['components']['country_code'];

    final String continent = json['components']['continent'];
    final String openstreetmapUrl = json['annotations']['OSM']['url'];
    final String latitude = json['geometry']['lat'].toString();
    final String longitude = json['geometry']['lng'].toString();

    return Location(
        fullName: fullName,
        village: village,
        state: state,
        county: county,
        country: country,
        countryCode: countryCode,
        continent: continent,
        openstreetmapUrl: openstreetmapUrl,
        latitude: latitude,
        longitude: longitude);
  }

  // to dispay Object
  Map<String, dynamic> toJson() {
    return {
      'fullName': this.fullName,
      'village': this.village,
      'state': this.state,
      'county': this.county,
      'country': this.country,
      'countryCode': this.countryCode,
      'continent': this.continent,
      'openstreetmapUrl': this.openstreetmapUrl,
      'latitude': this.latitude,
      'longitude': this.longitude,
      'time': this.time
    };
  }
}
