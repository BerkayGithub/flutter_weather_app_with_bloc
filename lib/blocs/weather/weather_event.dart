part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent{
  final String sehirAdi;
  const FetchWeatherEvent({required this.sehirAdi});

  @override
  List<Object?> get props => [sehirAdi];

}