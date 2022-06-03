import 'dart:ui';
import 'package:dio_package_app/comands/text_helper.dart';
import 'package:dio_package_app/comands/theme_helper.dart';
import 'package:dio_package_app/helpers/catch_exception.dart';
import 'package:dio_package_app/screens/city_weather_screen/city_weather_screen.dart';
import 'package:dio_package_app/screens/city_weather_screen/widgets/text_widget.dart';
import 'package:dio_package_app/screens/main_screen/bloc/weather_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controller = TextEditingController();
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
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ClipRRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Image.asset(
                  'assets/images/f904017c6c0e2371bc1c3b71eafa4e66.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WEATHER',
                    style: TextHelper.medium14.copyWith(
                        color: ThemeHelper.blueGrey,
                        letterSpacing: 15,
                        fontSize: 40),
                  ),
                  const SizedBox(height: 100),
                  SizedBox(
                    width: 350,
                    height: 40,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0.5),
                          prefixIcon: Icon(Icons.search_outlined),
                          hintText: 'Enter the name of city',
                          hintStyle: const TextStyle(fontSize: 14),
                          filled: true,
                          fillColor: ThemeHelper.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: ThemeHelper.grey, width: 2))),
                    ),
                  ),
                  const SizedBox(height: 100),
                  BlocListener<WeatherBloc, WeatherState>(
                    bloc: _weatherBloc,
                    listener: (context, state) {
                      if (state is WeatherErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.error.message!)));
                      }
                      if (state is WeatherFetchedState) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CityWeatherScreen(
                              weatherModel: state.weatherModel,
                            ),
                          ),
                        );
                        _controller.clear();
                      }
                    },
                    child: OutlinedButton(
                      onPressed: () {
                        if (_controller.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Поле не может быть пустым')));
                        } else {
                          _weatherBloc
                              .add(GetWeatherEvent(city: _controller.text));
                        }
                      },
                      child: Text(
                        'SEARCH',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 15,
                        ),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(ThemeHelper.white)),
                    ),
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
