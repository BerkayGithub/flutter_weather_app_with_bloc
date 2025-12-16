import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app_with_bloc/data/weather_repository.dart';
import 'package:flutter_weather_app_with_bloc/locator.dart';

import '../../models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherEvent>(_fetchWeather);
    on<RefreshWeatherEvent>(_refreshWeather);
  }

  Future<void> _fetchWeather(FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    try{
      final Weather getirilenWeather = await weatherRepository.fetchWeather(event.sehirAdi);
      emit(WeatherLoadedState(weather: getirilenWeather));
    }catch(e){
      emit(WeatherErrorState());
    }
  }

  Future<void> _refreshWeather(RefreshWeatherEvent event, Emitter<WeatherState> emit) async {
    try{
      final Weather getirilenWeather = await weatherRepository.fetchWeather(event.sehirAdi);
      emit(WeatherLoadedState(weather: getirilenWeather));
    }catch(e){
      emit(state);
    }
  }
}
