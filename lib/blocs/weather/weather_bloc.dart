import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app_with_bloc/data/weather_repository.dart';

import '../../models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<FetchWeatherEvent>(_fetchWeather);
  }


  Future<void> _fetchWeather(FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    try{
      await weatherRepository.fetchWeather(event.sehirAdi);
      emit(WeatherLoadedState(weather: Weather()));
    }catch(e){
      emit(WeatherErrorState());
    }
  }
}
