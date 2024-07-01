import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/counter_cubit.dart';
import '../cubits/counter_state.dart';
import '../widgets/custom_buttom.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Points Counter', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('Team A',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.w500)),
                    Text("${BlocProvider.of<CounterCubit>(context).counterA}",
                        style: const TextStyle(fontSize: 150)),
                    CustumButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .counterIncrement(team: 'A', buttonNumber: 1);
                        },
                        txt: "Add 1 Point"),
                    const SizedBox(
                      height: 15,
                    ),
                    CustumButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .counterIncrement(team: 'A', buttonNumber: 2);
                        },
                        txt: "Add 2 Point"),
                    const SizedBox(
                      height: 15,
                    ),
                    CustumButton(
                        txt: "Add 3 Point",
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .counterIncrement(team: 'A', buttonNumber: 3);
                        }),
                  ],
                ),
                const SizedBox(
                  height: 500,
                  child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 1,
                      endIndent: 35,
                      indent: 70),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('Team B',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.w500)),
                    Text("${BlocProvider.of<CounterCubit>(context).counterB}",
                        style: const TextStyle(fontSize: 150)),
                    CustumButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .counterIncrement(team: 'B', buttonNumber: 1);
                        },
                        txt: "Add 1 Point"),
                    const SizedBox(
                      height: 15,
                    ),
                    CustumButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .counterIncrement(team: 'B', buttonNumber: 2);
                        },
                        txt: "Add 2 Point"),
                    const SizedBox(
                      height: 15,
                    ),
                    CustumButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context)
                              .counterIncrement(team: 'B', buttonNumber: 3);
                        },
                        txt: "Add 3 Point"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.orange),
                minimumSize: MaterialStatePropertyAll(Size(200, 50)),
              ),
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).counterReset();
              },
              child: const Text(
                "Reset",
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            )
          ],
        ),
      ),
    );
  }
}
