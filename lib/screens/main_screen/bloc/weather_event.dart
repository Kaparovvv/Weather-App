part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final String city;

  GetWeatherEvent({required this.city});
}
