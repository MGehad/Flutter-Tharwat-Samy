import '../../models/weather_data_model.dart';

class WeatherState {}

class InitialWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherDataModle WeatherModel;

  WeatherLoadedState({required this.WeatherModel});
}

class WeatherErrorState extends WeatherState {
  final String errorMsg;

  WeatherErrorState({required this.errorMsg});
}
