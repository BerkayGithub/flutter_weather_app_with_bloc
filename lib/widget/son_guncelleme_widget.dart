import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather/weather_bloc.dart';

class SonGuncellemeWidget extends StatelessWidget {
  final String songuncellemeTarihi;

  const SonGuncellemeWidget({super.key, required this.songuncellemeTarihi});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _weatherBloc,
      builder: (context, WeatherState state) {
        return Text(
          "Son Güncelleme ${(state as WeatherLoadedState).weather.current!.lastUpdated!}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}
