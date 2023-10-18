import 'dart:convert';
import 'dart:developer';

import '../models/weather_forecast_daily.dart';
import '../utilites/constanse.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<Weather_forecast> fetchWeatherForecastWithCity(
      {required String cityName}) async {
    var queryParametrs = {
      'APPID': Contastans.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.https(Contastans.WEATHER_BASE_URL_DOMAIN,
        Contastans.WEATHER_FORECAST_PATH, queryParametrs);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return Weather_forecast.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error response");
    }
  }
}
