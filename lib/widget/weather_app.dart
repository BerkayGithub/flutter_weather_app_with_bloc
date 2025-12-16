import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_with_bloc/blocs/tema/tema_bloc.dart';
import 'package:flutter_weather_app_with_bloc/blocs/weather/weather_bloc.dart';
import 'package:flutter_weather_app_with_bloc/widget/gecisli_arkaplan_widget.dart';
import 'package:flutter_weather_app_with_bloc/widget/hava_durumu_resmi_widget.dart';
import 'package:flutter_weather_app_with_bloc/widget/location_widget.dart';
import 'package:flutter_weather_app_with_bloc/widget/max_min_sicaklik_widget.dart';
import 'package:flutter_weather_app_with_bloc/widget/sehir_sec_widget.dart';
import 'package:flutter_weather_app_with_bloc/widget/son_guncelleme_widget.dart';

class WeatherApp extends StatelessWidget {
  final String title;
  String? secilenSehir = "Ankara";
  Completer<void> refreshCompleter = Completer<void>();

  WeatherApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Hava Durumu"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              secilenSehir = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SehirSecWidget()),
              );
              if (secilenSehir != null) {
                weatherBloc.add(FetchWeatherEvent(sehirAdi: secilenSehir!));
              }
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: weatherBloc,
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(child: Text("Lütfen bir şehir seçiniz"));
            }
            if (state is WeatherLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoadedState) {
              refreshCompleter.complete();
              refreshCompleter = Completer();
              final getirilenWeather = state.weather;
              secilenSehir = state.weather.location!.name;
              BlocProvider.of<TemaBloc>(context).add(
                TemaDegistir(
                  havaDurumuKisaltmasi:
                      getirilenWeather.current!.condition!.text!,
                ),
              );

              return BlocBuilder<TemaBloc, TemaState>(
                bloc: BlocProvider.of<TemaBloc>(context),
                builder: (context, state) {
                  return GecisliArkaplanWidget(
                    renk: (state as UygulamaTemasi).renk,
                    child: RefreshIndicator(
                      onRefresh: () {
                        weatherBloc.add(
                          RefreshWeatherEvent(sehirAdi: secilenSehir!),
                        );
                        return refreshCompleter.future;
                      },
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: LocationWidget(
                                secilenSehir: getirilenWeather.location!.name!,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: SonGuncellemeWidget(
                                songuncellemeTarihi:
                                    getirilenWeather.current!.lastUpdated!,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: HavaDurumuResmiWidget(
                                iconUrl:
                                    "https:${getirilenWeather.current!.condition!.icon!}",
                                currentHeat: getirilenWeather.current!.tempC!
                                    .toInt()
                                    .toString(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: MaxMinSicaklikWidget()),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (state is WeatherErrorState) {
              return Center(child: Text("Konum bulunamadı"));
            }
            return Center(child: Text("Search for a city"));
          },
        ),
      ),
    );
  }
}
