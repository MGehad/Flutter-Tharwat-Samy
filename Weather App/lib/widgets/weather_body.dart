import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/day_weather_column.dart';
import '../main.dart';
import '../models/weather_data_model.dart';
import 'hour_weather_container.dart';

class WeatherBody extends StatefulWidget {
  final WeatherDataModle model;

  const WeatherBody({Key? key, required this.model}) : super(key: key);

  @override
  State<WeatherBody> createState() => _WeatherBodyState();
}

class _WeatherBodyState extends State<WeatherBody> {
  int n = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getColorTheme(widget.model.listOfDays[n].status),
            Colors.white
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (0 < n) n--;
                    BlocProvider.of<GetWeatherCubit>(context).getCurrentWeather(
                        city: widget.model.cityName, dayNumber: n);
                  });
                },
                icon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Colors.white.withOpacity(.4),
                  ),
                  child: const Icon(Icons.chevron_left),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(.4),
                ),
                child: Text(
                  widget.model.listOfDays[n].date,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (widget.model.listOfDays.length - 1 > n) n++;
                    BlocProvider.of<GetWeatherCubit>(context).getCurrentWeather(
                        city: widget.model.cityName, dayNumber: n);
                  });
                },
                icon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Colors.white.withOpacity(.4),
                  ),
                  child: const Icon(Icons.chevron_right),
                ),
              ),
            ],
          ),
          DayWeatherColumn(model: widget.model, n: n),
          SizedBox(
            height: 120,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: widget.model.listOfDays[n].hourlyWeather.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: HourWeatherContainer(
                      model: widget.model.listOfDays[n].hourlyWeather[index]),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
