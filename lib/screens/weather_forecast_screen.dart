import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meow_weather/API/weather_api.dart';

import '../models/weather_forecast_daily.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<Weather_forecast> forecastObject;
  String _cityName = 'Odessa';

  @override
  void initState() {
    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);

    forecastObject.then((weather) {
      print(weather.list![0].weather?[0].main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Meow Weather"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: Container(
              child: FutureBuilder<Weather_forecast>(
                  future: forecastObject,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text("Всё хорошо");
                    } else
                      return Center(
                        child: SpinKitDoubleBounce(
                          color: Colors.black,
                          size: 100,
                        ),
                      );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
