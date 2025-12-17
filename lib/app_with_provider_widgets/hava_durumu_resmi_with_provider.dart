import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/weather_view_model.dart';

class HavaDurumuResmiWithProvider extends StatelessWidget {
  const HavaDurumuResmiWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    return Column(
      children: [
        Text("${_weatherViewModel.getirilenWeather.current!.tempC!.toInt()}°C", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        Image.network("https:${_weatherViewModel.getirilenWeather.current!.condition!.icon!}", scale: 0.25),
      ],
    );
  }
}
