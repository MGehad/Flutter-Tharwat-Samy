import 'package:basketball_counter_app/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int teamACounter = 0;
  int teamBCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Points Counter', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
      ),
      body: Column(
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
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w500)),
                  Text("$teamACounter", style: const TextStyle(fontSize: 150)),
                  CustumButton(
                      onPressed: () {
                        setState(() {
                          teamACounter++;
                        });
                      },
                      txt: "Add 1 Point"),
                  const SizedBox(
                    height: 15,
                  ),
                  CustumButton(
                      onPressed: () {
                        setState(() {
                          teamACounter += 2;
                        });
                      },
                      txt: "Add 2 Point"),
                  const SizedBox(
                    height: 15,
                  ),
                  CustumButton(
                      txt: "Add 3 Point",
                      onPressed: () {
                        setState(() {
                          teamACounter += 3;
                        });
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
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w500)),
                  Text("$teamBCounter", style: const TextStyle(fontSize: 150)),
                  CustumButton(
                      onPressed: () {
                        setState(() {
                          teamBCounter++;
                        });
                      },
                      txt: "Add 1 Point"),
                  const SizedBox(
                    height: 15,
                  ),
                  CustumButton(
                      onPressed: () {
                        setState(() {
                          teamBCounter += 2;
                        });
                      },
                      txt: "Add 2 Point"),
                  const SizedBox(
                    height: 15,
                  ),
                  CustumButton(
                      onPressed: () {
                        setState(() {
                          teamBCounter += 3;
                        });
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
              setState(() {
                teamACounter = teamBCounter = 0;
              });
            },
            child: const Text(
              "Reset",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          )
        ],
      ),
    );
  }
}
