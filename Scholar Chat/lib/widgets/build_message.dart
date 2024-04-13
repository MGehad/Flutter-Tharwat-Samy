import 'package:flutter/material.dart';
import 'package:scholar_chat/models/message_model.dart';
import '../consts.dart';

class MyMessage extends StatelessWidget {
  final MessageModel model;

  const MyMessage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(7),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              model.message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "${model.createdAt.hour}:${model.createdAt.minute}",
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OthersMessage extends StatelessWidget {
  final MessageModel model;

  const OthersMessage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(7),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xfff006D84),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "${model.createdAt.hour}:${model.createdAt.minute}",
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
