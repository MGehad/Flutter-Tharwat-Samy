import 'package:scholar_chat/consts.dart';

class MessageModel {
  String message;
  DateTime createdAt;
  String id;

  MessageModel(
      {required this.message, required this.createdAt, required this.id});

  factory MessageModel.fromJson(json) {
    return MessageModel(
        message: json[messageAtribute],
        createdAt: json[createdAtAtribute].toDate(),
        id: json[idAtribute]);
  }
}
