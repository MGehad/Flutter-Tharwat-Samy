import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/weather_cubit/get_weather_cubit.dart';
import 'cubits/weather_cubit/get_weather_state.dart';
import 'helper/get_color_theme.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: state is WeatherLoadedState
                  ? GetColorTheme.getColorTheme(
                      state.WeatherModel.listOfDays[state.dayNumber].status)
                  : Colors.blue,
            ),
            primarySwatch: state is WeatherLoadedState
                ? GetColorTheme.getColorTheme(
                    state.WeatherModel.listOfDays[state.dayNumber].status)
                : Colors.blue,
          ),
          home: const HomeView(),
        ),
      ),
    );
  }
}

