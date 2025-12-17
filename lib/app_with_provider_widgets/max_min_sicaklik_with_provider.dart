import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/weather_view_model.dart';

class MaxMinSicaklikWithProvider extends StatelessWidget {
  const MaxMinSicaklikWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "Celcius : ${_weatherViewModel.getirilenWeather.current!.tempC!}°C",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          "Fahrenheit : ${_weatherViewModel.getirilenWeather.current!.tempF!}°F",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
