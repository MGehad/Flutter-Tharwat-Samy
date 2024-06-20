import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text('Data'),
            ),
            titleTextStyle:
                const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            subtitle: Text(
              'Build Your App Build Your App Build Your App Build Your App Build Your App Build Your App ',
              style: TextStyle(fontSize: 18.0),
            ),
            trailing: IconButton(
              iconSize: 32,
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
              ),
            ),
            onTap: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 18.0, top: 8.0, bottom: 2.0),
            child: Text(
              'May 21,2022',
              style: TextStyle(fontSize: 15.0),
            ),
          )
        ],
      ),
    );
  }
}
