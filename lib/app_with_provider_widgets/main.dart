import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_bloc/app_with_provider_widgets/weather_app_with_provider.dart';
import 'package:flutter_weather_app_with_bloc/viewmodels/my_theme_view_model.dart';
import 'package:flutter_weather_app_with_bloc/viewmodels/weather_view_model.dart';
import 'package:provider/provider.dart';

import '../locator.dart';

void main() {
  setupLocator();
  runApp(
    ChangeNotifierProvider<MyThemeViewModel>(
      create: (BuildContext context) {
        return locator<MyThemeViewModel>();
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeViewModel>(
      builder:
          (
            BuildContext context,
            MyThemeViewModel myThemeViewModel,
            Widget? child,
          ) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: myThemeViewModel.myTheme.tema,
            home: ChangeNotifierProvider<WeatherViewModel>(
              create: (BuildContext context) {
                return locator<WeatherViewModel>();
              },
              child: WeatherAppWithProvider(title: 'Flutter Demo Home Page'),
            ),
          ),
    );
  }
}
