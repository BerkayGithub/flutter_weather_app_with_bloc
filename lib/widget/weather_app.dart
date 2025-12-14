import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_bloc/widget/hava_durumu_resmi_widget.dart';
import 'package:flutter_weather_app_with_bloc/widget/location_widget.dart';
import 'package:flutter_weather_app_with_bloc/widget/max_min_sicaklik_widget.dart';
import 'package:flutter_weather_app_with_bloc/widget/sehir_sec_widget.dart';
import 'package:flutter_weather_app_with_bloc/widget/son_guncelleme_widget.dart';

class WeatherApp extends StatelessWidget {
  final String title;
  String secilenSehir = "Ankara";

  WeatherApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hava Durumu"),
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              secilenSehir = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SehirSecWidget()),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: LocationWidget(secilenSehir: secilenSehir,)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: SonGuncellemeWidget()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: HavaDurumuResmiWidget()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: MaxMinSicaklikWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
