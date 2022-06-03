import 'package:dio/dio.dart';
import 'package:dio_package_app/helpers/catch_exception.dart';

class ApiRequester {
  static String url = 'https://api.openweathermap.org/data/2.5/weather';
  Future<Dio> initDio() async {
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ),
    );
  }

  Future<Response> toGet(String url, {Map<String, dynamic>? param}) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: param);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
