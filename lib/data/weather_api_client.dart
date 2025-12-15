import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather.dart';

class WeatherApiClient{
  static const baseUrl = "http://api.weatherapi.com/v1";
  final http.Client httpClient = http.Client();
  final authKey = "d0e21d99cf784318b6f135021251512";

  Future<Weather> fetchWeather(String sehir) async{
    final currentWeatherUrl = "$baseUrl/current.json?q=$sehir&key=$authKey";
    final gelenCevap = await httpClient.get(Uri.parse(currentWeatherUrl));

    if(gelenCevap.statusCode != 200){
      throw Exception("Veri gelmedi");
    }

    final havaDurumuJSON = jsonDecode(gelenCevap.body);
    return Weather.fromMap(havaDurumuJSON);
  }
}