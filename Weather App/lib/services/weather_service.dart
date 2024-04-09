import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/weather_data_model.dart';

class WeatherService {
  final Dio dio;
  final String apiKey = "6ca4338d11bb41b68b0141018240604";
  final String url = "https://api.weatherapi.com/v1";

  WeatherService({required this.dio});

  Future<WeatherDataModle> getCurrentWeather({required String city}) async {
    try {
      Response response =
          await dio.get("$url/forecast.json?key=$apiKey&q=$city&days=10");
      WeatherDataModle model = WeatherDataModle.fromJson(response.data);
      return model;
    } on DioException catch (e) {
      final String errormsg = e.response?.data['error']['message'] ??
          'oops there was an error, try later...';
      throw Exception(errormsg);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}
