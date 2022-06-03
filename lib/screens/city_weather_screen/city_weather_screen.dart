import 'dart:ui';

import 'package:dio_package_app/comands/formatting_helper.dart';
import 'package:dio_package_app/models/weather_model.dart';
import 'package:dio_package_app/screens/city_weather_screen/widgets/arrow_button_widget.dart';
import 'package:dio_package_app/screens/city_weather_screen/widgets/column_text_widget.dart';
import 'package:dio_package_app/screens/city_weather_screen/widgets/text_icon_widget.dart';
import 'package:dio_package_app/screens/city_weather_screen/widgets/text_widget.dart';
import 'package:dio_package_app/screens/main_screen/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';

class CityWeatherScreen extends StatefulWidget {
  final WeatherModel weatherModel;

  const CityWeatherScreen({Key? key, required this.weatherModel})
      : super(key: key);

  @override
  State<CityWeatherScreen> createState() => _CityWeatherScreenState();
}

class _CityWeatherScreenState extends State<CityWeatherScreen> {
  late WeatherBloc _weatherBloc;

  @override
  void initState() {
    _weatherBloc = WeatherBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ClipRRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 5),
                child: Image.network(
                  'https://i.pinimg.com/564x/4e/22/57/4e2257ce54d1359137c6f15b0d16b3ec.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 50, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                      text: FormattingHelper()
                          .getDateYearFormat(widget.weatherModel.dt)
                          .toString(),
                      fontSize: 15,
                      textColor: Colors.grey.shade300,
                      fontWeight: FontWeight.w400),
                  const SizedBox(height: 5),
                  TextWidget(
                      text: FormattingHelper()
                          .getDateHoursFormat(widget.weatherModel.dt)
                          .toString(),
                      fontSize: 15,
                      textColor: Colors.grey.shade300,
                      fontWeight: FontWeight.w900),
                  const SizedBox(height: 50),
                  TextWidget(
                      text: widget.weatherModel.name!,
                      fontSize: 40,
                      textColor: Colors.white70,
                      fontWeight: FontWeight.w600),
                  Image.network(
                      'http://openweathermap.org/img/wn/${widget.weatherModel.weather!.first.icon}@4x.png'),
                  TextIconWidget(
                    text: FormattingHelper()
                        .getGradusFormat(widget.weatherModel.main!.temp),
                    iconName: Icons.trip_origin,
                    textSize: 50,
                    iconSize: 15,
                    textIconColor: Colors.white,
                  ),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ColumnTextWidget(
                        name: 'Влажность',
                        text: widget.weatherModel.main!.humidity.toString(),
                        textSize: 20,
                        iconName: Icons.whatshot_outlined,
                        iconSize: 15,
                        textIconColor: Colors.blueGrey.shade100,
                      ),
                      ColumnTextWidget(
                        name: 'Maximum',
                        text: FormattingHelper().getGradusFormat(
                            widget.weatherModel.main!.feelsLike),
                        textSize: 20,
                        iconName: Icons.trip_origin,
                        iconSize: 10,
                        textIconColor: Colors.blueGrey.shade100,
                      ),
                      ColumnTextWidget(
                        name: 'Давление',
                        text: FormattingHelper()
                            .getGradusFormat(widget.weatherModel.main!.tempMax),
                        textSize: 20,
                        iconName: Icons.sync,
                        iconSize: 15,
                        textIconColor: Colors.blueGrey.shade100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ArrowButtonWidget(buttonText: 'BACK'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// London Bishkek Osh
