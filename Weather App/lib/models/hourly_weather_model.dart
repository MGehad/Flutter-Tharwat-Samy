class HourlyWeatherModel {
  DateTime date;
  String imagePath;
  double temperature;

  HourlyWeatherModel(
      {required this.temperature, required this.imagePath, required this.date});

  factory HourlyWeatherModel.fromJson(hour) {
    return HourlyWeatherModel(
      temperature: hour['temp_c'],
      imagePath: "https:" + hour['condition']['icon'],
      date: DateTime.parse(
        hour['time'],
      ),
    );
  }
}
