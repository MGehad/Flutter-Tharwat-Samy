import '../../models/weather_data_model.dart';

class WeatherState {}

class InitialWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherDataModle WeatherModel;
  final int dayNumber;

  WeatherLoadedState({required this.WeatherModel,required this.dayNumber});
}

class WeatherErrorState extends WeatherState {
  final String errorMsg;

  WeatherErrorState({required this.errorMsg});
}
