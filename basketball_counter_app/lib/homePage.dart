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
        title: Text('Points Counter', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text('Team A',
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w500)),
                  Text("$teamACounter", style: TextStyle(fontSize: 150)),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange),
                        minimumSize: MaterialStatePropertyAll(Size(125, 45))),
                    onPressed: () {
                      setState(() {
                        teamACounter++;
                      });
                    },
                    child: Text(
                      "Add 1 Point",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange),
                        minimumSize: MaterialStatePropertyAll(Size(125, 45))),
                    onPressed: () {
                      setState(() {
                        teamACounter += 2;
                      });
                    },
                    child: Text(
                      "Add 2 Point",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange),
                        minimumSize: MaterialStatePropertyAll(Size(125, 45))),
                    onPressed: () {
                      setState(() {
                        teamACounter += 3;
                      });
                    },
                    child: Text(
                      "Add 3 Point",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 500,
                child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                    endIndent: 35,
                    indent: 70),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text('Team B',
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w500)),
                  Text("$teamBCounter", style: TextStyle(fontSize: 150)),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange),
                        minimumSize: MaterialStatePropertyAll(Size(125, 45))),
                    onPressed: () {
                      setState(() {
                        teamBCounter++;
                      });
                    },
                    child: Text(
                      "Add 1 Point",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange),
                        minimumSize: MaterialStatePropertyAll(Size(125, 45))),
                    onPressed: () {
                      setState(() {
                        teamBCounter += 2;
                      });
                    },
                    child: Text(
                      "Add 2 Point",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange),
                        minimumSize: MaterialStatePropertyAll(Size(125, 45))),
                    onPressed: () {
                      setState(() {
                        teamBCounter += 3;
                      });
                    },
                    child: Text(
                      "Add 3 Point",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.orange),
                minimumSize: MaterialStatePropertyAll(Size(200, 50))),
            onPressed: () {
              setState(() {
                teamACounter = teamBCounter = 0;
              });
            },
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          )
        ],
      ),
    );
  }
}
