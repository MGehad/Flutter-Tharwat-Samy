import 'package:flutter/cupertino.dart';
import '../models/weather_data_model.dart';

class DayWeatherColumn extends StatelessWidget {
  final WeatherDataModel model;
  final int n;

  const DayWeatherColumn({required this.model, required this.n, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          model.cityName,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "updated at ${model.date.hour}:${model.date.minute}",
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(child: Image.network(model.listOfDays[n].imagePath)),
              Text(
                "${model.listOfDays[n].avgTemp.round()}°",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Maxtemp: ${model.listOfDays[n].maxTemp.round()}\n"
                "Mintemp: ${model.listOfDays[n].minTemp.round()}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        Text(
          model.listOfDays[n].status,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
