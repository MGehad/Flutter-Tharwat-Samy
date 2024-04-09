import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/weather_data_model.dart';
import '../../services/weather_service.dart';
import 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialWeatherState());

  getCurrentWeather({required String city}) async {
    try {
      WeatherDataModle weatherModel =
          await WeatherService(dio: Dio()).getCurrentWeather(city: city);
      emit(WeatherLoadedState(WeatherModel: weatherModel));
    } catch (e) {
      emit(WeatherErrorState(errorMsg: e.toString()));
    }
  }
}
