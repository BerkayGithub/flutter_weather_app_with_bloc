import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_with_bloc/viewmodels/weather_view_model.dart';
import 'package:provider/provider.dart';

import '../blocs/weather/weather_bloc.dart';

class SonGuncellemeWithProvider extends StatelessWidget {
  const SonGuncellemeWithProvider({super.key});
  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);

    return Text(
      "Son Güncelleme ${_weatherViewModel.getirilenWeather.current!.lastUpdated!}",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
