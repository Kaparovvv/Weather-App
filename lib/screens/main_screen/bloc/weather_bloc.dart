import 'package:bloc/bloc.dart';
import 'package:dio_package_app/helpers/catch_exception.dart';
import 'package:dio_package_app/models/weather_model.dart';
import 'package:dio_package_app/screens/main_screen/bloc/repository/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeatherEvent>(
      (event, emit) async {
        emit(WeatherLoadingState());
        try {
          WeatherModel weatherModel =
              await WeatherRepository().getWeather(event.city);
          emit(WeatherFetchedState(weatherModel: weatherModel));
        } catch (e) {
          emit(WeatherErrorState(error: CatchException.convertException(e)));
        }
      },
    );
  }
}
