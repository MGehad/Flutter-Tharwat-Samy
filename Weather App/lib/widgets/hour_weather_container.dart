import 'package:flutter/material.dart';

import '../models/hourly_weather_model.dart';

class HourWeatherContainer extends StatelessWidget {
  final HourlyWeatherModel model;

  const HourWeatherContainer({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.3),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${model.date.hour}:00",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Image.network(model.imagePath),
          Text(
            "${model.temperature.round()}°",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
