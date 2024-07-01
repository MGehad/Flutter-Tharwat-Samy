import 'daily_weather_model.dart';

class WeatherDataModel {
  final String cityName;
  final DateTime date;
  final List<DailyWeatherModel> listOfDays;

  WeatherDataModel({
    required this.cityName,
    required this.date,
    required this.listOfDays,
  });

  factory WeatherDataModel.fromJson(json) {
    List<DailyWeatherModel> days = [];
    for (var day in json['forecast']['forecastday']) {
      days.add(
        DailyWeatherModel.fromJson(day),
      );
    }

    return WeatherDataModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      listOfDays: days,
    );
  }
}
