import 'daily_weather_model.dart';

class WeatherDataModle {
  final String cityName;
  final DateTime date;
  final List<DailyWeatherModel> listOfDays;

  WeatherDataModle({
    required this.cityName,
    required this.date,
    required this.listOfDays,
  });

  factory WeatherDataModle.fromJson(json) {
    List<DailyWeatherModel> days = [];
    for (var day in json['forecast']['forecastday']) {
      days.add(
        DailyWeatherModel.fromJson(day),
      );
    }

    return WeatherDataModle(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      listOfDays: days,
    );
  }
}
