import 'hourly_weather_model.dart';

class DailyWeatherModel {
  String date;
  String imagePath;
  double maxTemp;
  double minTemp;
  double avgTemp;
  String status;
  List<HourlyWeatherModel> hourlyWeather;

  DailyWeatherModel({
    required this.date,
    required this.imagePath,
    required this.avgTemp,
    required this.status,
    required this.maxTemp,
    required this.minTemp,
    required this.hourlyWeather,
  });

  factory DailyWeatherModel.fromJson(day) {
    List<HourlyWeatherModel> hours = [];
    for (var hour in day['hour']) {
      hours.add(HourlyWeatherModel.fromJson(hour));
    }
    return DailyWeatherModel(
        date: day['date'],
        imagePath: "https:" + day['day']['condition']['icon'],
        status: day['day']['condition']['text'],
        maxTemp: day['day']['maxtemp_c'],
        avgTemp: day['day']['avgtemp_c'],
        minTemp: day['day']['mintemp_c'],
        hourlyWeather: hours);
  }
}
