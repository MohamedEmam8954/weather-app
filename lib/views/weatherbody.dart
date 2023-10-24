import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

class Weatherbody extends StatelessWidget {
  const Weatherbody({super.key, required this.weathermodel});
  final Weathermodel? weathermodel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  getConditionImage(weathermodel!.states),
                ),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.sort,
                      color: Colors.white,
                      size: 25,
                    ),
                  ],
                ),
              ),
              Text(
                weathermodel!.states,
                style: TextStyle(
                    fontSize: 30, color: Colors.white.withOpacity(0.6)),
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                weathermodel!.City_name,
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                weathermodel!.avgtempc.round().toString(),
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "H ",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${weathermodel!.maxtempc}°C",
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "L ",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${weathermodel!.mintempc}°C",
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getConditionImage(String condition) {
  if (condition.toLowerCase() == "sunny") {
    return "assets/sunny (2).png";
  } else if (condition.toLowerCase() == "partly cloudy") {
    return "assets/partly cloudy.png";
  } else if (condition.toLowerCase() == "cloudy") {
    return "assets/cloudy.png";
  } else if (condition.toLowerCase() == "overcast") {
    return "assets/overcast.png";
  } else if (condition.toLowerCase() == "mist") {
    return "assets/mist.png";
  } else if (condition.toLowerCase() == "patchy rain possible" ||
      condition.toLowerCase() == "moderate rain") {
    return "assets/rainy.png";
  } else if (condition == "patchy snow possible") {
    return "assets/patchy snow possible.png";
  }
  return "assets/weather.jpg";
}
