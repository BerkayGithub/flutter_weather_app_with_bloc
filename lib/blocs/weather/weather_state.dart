part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
}

final class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

final class WeatherLoadingState extends WeatherState{
  @override
  List<Object?> get props => [];
}

final class WeatherLoadedState extends WeatherState{
  final Weather weather;
  const WeatherLoadedState({required this.weather});

  @override
  List<Object?> get props => [weather];
}

final class WeatherErrorState extends WeatherState{
  @override
  List<Object?> get props => [];
}