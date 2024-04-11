import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/weather_cubit/get_weather_cubit.dart';
import 'cubits/weather_cubit/get_weather_state.dart';
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
            primarySwatch: state is WeatherLoadedState
                ? getColorTheme(state.WeatherModel.listOfDays[state.dayNumber].status)
                : Colors.blue,
          ),
          home: const HomeView(),
        ),
      ),
    );
  }
}

MaterialColor getColorTheme(String condition) {
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy light drizzle':
    case 'Patchy light rain':
    case 'Patchy light snow':
    case 'Patchy light rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Light drizzle':
    case 'Light rain':
    case 'Light rain shower':
    case 'Light showers of ice pellets':
    case 'Light sleet showers':
    case 'Light snow':
    case 'Light snow showers':
    case 'Patchy freezing drizzle possible':
    case 'Patchy light sleet':
    case 'Patchy heavy sleet':
    case 'Moderate or heavy sleet':
      return Colors.lightBlue;
    case 'Cloudy':
    case 'Patchy moderate snow':
    case 'Patchy heavy snow':
    case 'Moderate snow':
    case 'Moderate or heavy snow':
    case 'Moderate or heavy snow showers':
    case 'Moderate or heavy snow with thunder':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Heavy snow':
    case 'Heavy snow':
      return Colors.blueGrey;
    case 'Overcast':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Moderate or heavy rain shower':
    case 'Moderate or heavy rain with thunder':
    case 'Moderate or heavy showers of ice pellets':
    case 'Thundery outbreaks possible':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Torrential rain shower':
    case 'Moderate or heavy freezing rain':
      return Colors.blue;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Ice pellets':
      return Colors.grey;
    default:
      return Colors.grey;
  }
}
