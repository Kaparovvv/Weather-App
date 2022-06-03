import 'package:dio_package_app/models/weather_model.dart';
import 'package:dio_package_app/screens/main_screen/bloc/weather_provider.dart';

class WeatherRepository{
  Future<WeatherModel> getWeather(String city){
    WeatherProvider provider = WeatherProvider();
    return provider.getWeather(city);
  }
}