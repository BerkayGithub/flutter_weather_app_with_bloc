import 'package:flutter_weather_app_with_bloc/data/weather_api_client.dart';
import 'package:flutter_weather_app_with_bloc/data/weather_repository.dart';
import 'package:flutter_weather_app_with_bloc/viewmodels/my_theme_view_model.dart';
import 'package:flutter_weather_app_with_bloc/viewmodels/weather_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton<WeatherRepository>(() => WeatherRepository());
  locator.registerLazySingleton<WeatherApiClient>(() => WeatherApiClient());
  locator.registerFactory<WeatherViewModel>(() => WeatherViewModel());
  locator.registerFactory<MyThemeViewModel>(() => MyThemeViewModel());
}