import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_bloc/widget/weather_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: WeatherApp(title: 'Flutter Demo Home Page'),
    );
  }
}

