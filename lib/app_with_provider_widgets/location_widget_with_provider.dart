import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/weather_view_model.dart';

class LocationWidgetWithProvider extends StatelessWidget {
  const LocationWidgetWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    return Text(
      _weatherViewModel.getirilenWeather.location!.name!,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
