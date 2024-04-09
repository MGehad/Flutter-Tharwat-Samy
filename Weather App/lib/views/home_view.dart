import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/weather_cubit/get_weather_cubit.dart';
import '../cubits/weather_cubit/get_weather_state.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_body.dart';
import 'search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 3,
          title: const Text("Weather App",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                icon: const Icon(Icons.search_sharp,
                    color: Colors.white, size: 26),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchView();
                      },
                    ),
                  );
                },
              ),
            ),
          ]),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherErrorState) {
            return Center(
              child: Text(
                state.errorMsg,
                style: const TextStyle(fontSize: 20),
              ),
            );
          } else if (state is WeatherLoadedState) {
            return WeatherBody(model: state.WeatherModel);
          } else {
            return const NoWeatherBody();
          }
        },
      ),
    );
  }
}
