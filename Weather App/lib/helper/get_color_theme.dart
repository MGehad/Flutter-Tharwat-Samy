import 'package:flutter/material.dart';

class GetColorTheme {
  static MaterialColor getColorTheme(String condition) {
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
}
