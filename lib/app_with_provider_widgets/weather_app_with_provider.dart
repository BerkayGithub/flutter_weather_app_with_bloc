import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_bloc/app_with_provider_widgets/hava_durumu_resmi_with_provider.dart';
import 'package:flutter_weather_app_with_bloc/app_with_provider_widgets/location_widget_with_provider.dart';
import 'package:flutter_weather_app_with_bloc/app_with_provider_widgets/max_min_sicaklik_with_provider.dart';
import 'package:flutter_weather_app_with_bloc/app_with_provider_widgets/son_guncelleme_with_provider.dart';
import 'package:flutter_weather_app_with_bloc/viewmodels/my_theme_view_model.dart';
import 'package:flutter_weather_app_with_bloc/viewmodels/weather_view_model.dart';
import 'package:flutter_weather_app_with_bloc/widget/gecisli_arkaplan_widget.dart';
import 'package:flutter_weather_app_with_bloc/widget/sehir_sec_widget.dart';
import 'package:provider/provider.dart';


class WeatherAppWithProvider extends StatelessWidget {
  final String title;
  String? secilenSehir = "Ankara";
  Completer<void> refreshCompleter = Completer<void>();
  late WeatherViewModel _weatherViewModel;

  WeatherAppWithProvider({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
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
              if(secilenSehir != null){
                _weatherViewModel.havaDurumunuGetir(secilenSehir!);
              }
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: (_weatherViewModel.state == WeatherState.weatherLoadedState) ? HavaDurumuGeldi() :
        (_weatherViewModel.state == WeatherState.weatherLoadingState) ? havaDurumuYukleniyor() :
        (_weatherViewModel.state == WeatherState.weatherErrorState) ? havaDurumuGetirHatasi() : Text("Şehir seçiniz")
      ),
    );
  }

  Text havaDurumuGetirHatasi() {
    return Text("Hava durumu yüklenemedi");
  }

  Widget havaDurumuYukleniyor() {
    return CircularProgressIndicator();
  }
}

class HavaDurumuGeldi extends StatefulWidget{
  const HavaDurumuGeldi({super.key});

  @override
  State<HavaDurumuGeldi> createState() => _HavaDurumuGeldiState();
}

class _HavaDurumuGeldiState extends State<HavaDurumuGeldi> {
  late Completer<void> refreshCompleter;
  late WeatherViewModel _weatherViewModel;

  @override
  void initState() {
    super.initState();
    refreshCompleter = Completer<void>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var havaDurumu = Provider.of<WeatherViewModel>(context, listen: false).getirilenWeather;
      Provider.of<MyThemeViewModel>(context, listen: false).temaDegistir(havaDurumu);
    });
  }

  @override
  Widget build(BuildContext context) {
    refreshCompleter.complete();
    refreshCompleter = Completer<void>();

    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    String getirilenSehir = _weatherViewModel.getirilenWeather.location!.name!;

    return GecisliArkaplanWidget(
      renk: Provider.of<MyThemeViewModel>(context).myTheme.renk,
      child: RefreshIndicator(
        onRefresh: (){
          _weatherViewModel.havaDurumunuGetir(getirilenSehir);
          return refreshCompleter.future;
        },
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: LocationWidgetWithProvider(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SonGuncellemeWithProvider(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: HavaDurumuResmiWithProvider(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: MaxMinSicaklikWithProvider()),
            ),
          ],
        ),
      ),
    );
  }
}