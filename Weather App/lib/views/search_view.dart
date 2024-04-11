import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController city = TextEditingController(text: '');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search for a city",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            controller: city,
            onSubmitted: (value) async {
              if (value.isNotEmpty) {
                BlocProvider.of<GetWeatherCubit>(context)
                    .getCurrentWeather(city: value, dayNumber: 0);
                Navigator.pop(context);
              }
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 28),
              labelText: "Search",
              hintText: "Enter the city...",
              suffixIcon: IconButton(
                icon: const Icon(Icons.search_sharp),
                onPressed: () {
                  if (city.text != '') {
                    BlocProvider.of<GetWeatherCubit>(context)
                        .getCurrentWeather(city: city.text, dayNumber: 0);
                    Navigator.pop(context);
                  }
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
