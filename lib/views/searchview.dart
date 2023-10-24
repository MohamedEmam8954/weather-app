import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weatherservices.dart';
import 'package:weatherapp/views/noweather.dart';
import 'package:weatherapp/views/weatherbody.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff22a0b6),
      appBar: AppBar(
        title: const Text(
          "Search Now",
          style: TextStyle(fontFamily: "Pacifico", fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff22a0b6),
                Color(0xff99dfe3),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: TextField(
                    onSubmitted: (value) async {
                      Weathermodel? weather;
                      weather = await Weatherservices(Dio())
                          .getcurrentweather(city_name: value);
                      if (weather == null) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const Noweather();
                          },
                        ));
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Weatherbody(
                              weathermodel: weather,
                            );
                          },
                        ));
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: const Icon(Icons.search),
                      label: const Text("search city"),
                      labelStyle: const TextStyle(fontSize: 18),
                      hintText: "enter city name",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
