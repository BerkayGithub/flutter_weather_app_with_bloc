import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather/weather_bloc.dart';

class MaxMinSicaklikWidget extends StatelessWidget {
  const MaxMinSicaklikWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _weatherBloc,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Celcius : ${(state as WeatherLoadedState).weather.current!.tempC!}°C",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "Fahrenheit : ${(state).weather.current!.tempF}°F",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )
          ],
        );
      },
    );
  }
}
