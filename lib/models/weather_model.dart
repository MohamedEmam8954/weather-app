class Weathermodel {
  final String City_name;
  final String last_updated;
  final double wind_mph;
  final double wind_kph;
  final String states;
  final double maxtempc;
  final double mintempc;
  final double avgtempc;
  Weathermodel(
      {required this.City_name,
      required this.avgtempc,
      required this.last_updated,
      required this.maxtempc,
      required this.mintempc,
      required this.states,
      required this.wind_kph,
      required this.wind_mph});

  factory Weathermodel.fromjson(json) {
    return Weathermodel(
      City_name: json["location"]["name"],
      avgtempc: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      last_updated: json["current"]["last_updated"],
      maxtempc: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      mintempc: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      states: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      wind_kph: json["current"]["wind_kph"],
      wind_mph: json["current"]["wind_mph"],
    );
  }
}
