import 'package:flutter/material.dart';

void main() {
  runApp(BusinessCard());
}

class BusinessCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF2B4961),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 112,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 110,
                backgroundImage: AssetImage("images/ScholarTech.jpg"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Mohamed Gehad",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
           const SizedBox(
              height: 5,
            ),
           const Text(
              "Flutter Developer",
              style: TextStyle(
                  color: Color(0xFF6C8090),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(
              thickness: 1,
              color: Color(0xFF6C8090),
              indent: 35,
              endIndent: 35,
              height: 25,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: const ListTile(
                leading: Icon(Icons.call, color: Color(0xFF2B4961), size: 28),
                title:  Text(
                  "(+20) 1224400926",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: const ListTile(
                leading: Icon(Icons.email, color: Color(0xFF2B4961), size: 28),
                title: Text(
                  "ENGMGehad@gmail.com",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
