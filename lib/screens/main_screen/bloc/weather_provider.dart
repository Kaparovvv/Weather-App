import 'package:dio/dio.dart';
import 'package:dio_package_app/helpers/api_requester.dart';
import 'package:dio_package_app/helpers/catch_exception.dart';
import 'package:dio_package_app/models/weather_model.dart';

class WeatherProvider {
  Future<WeatherModel> getWeather(String city) async {
    try {
      ApiRequester requester = ApiRequester();
      // print(city);
      Response response = await requester.toGet('', param: {
        'q': city,
        'appid': '0917b06e7052fbf28727117306bb0407',
      });
      if (response.statusCode == 200) {
        // print(response.data);
        return WeatherModel.fromJson(response.data);
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
       print('e === $e');
      throw CatchException.convertException(e);
    }
  }
}
