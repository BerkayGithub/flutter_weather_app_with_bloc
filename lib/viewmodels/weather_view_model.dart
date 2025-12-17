import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_bloc/data/weather_repository.dart';
import 'package:flutter_weather_app_with_bloc/locator.dart';
import 'package:flutter_weather_app_with_bloc/models/weather.dart';

enum WeatherState{initialWeatherState, weatherLoadingState, weatherLoadedState, weatherErrorState}

class WeatherViewModel with ChangeNotifier{

  late WeatherState _state;
  WeatherRepository repository = locator<WeatherRepository>();
  late Weather getirilenWeather;

  WeatherViewModel(){
    getirilenWeather = Weather();
    _state = WeatherState.initialWeatherState;
  }

  WeatherState get state => _state;

  set state(WeatherState weatherState){
    _state = weatherState;
    notifyListeners();
  }

  Future<Weather?> havaDurumunuGetir(String sehir) async{
    try{
      state = WeatherState.weatherLoadingState;
      getirilenWeather = await repository.fetchWeather(sehir);
      state = WeatherState.weatherLoadedState;
    }catch(e){
      state = WeatherState.weatherErrorState;
    }
    return getirilenWeather;
  }
}