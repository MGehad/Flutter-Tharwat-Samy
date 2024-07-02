import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../consts.dart';
import '../models/message_model.dart';
import '../widgets/build_message.dart';

class ChatView extends StatelessWidget {
  static String id = 'Chat View';

  ChatView({Key? key}) : super(key: key);

  CollectionReference messages =
      FirebaseFirestore.instance.collection(messagesCollection);

  TextEditingController messageController = TextEditingController();

  var controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(createdAtAtribute, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesModel = [];
          for (var model in snapshot.data!.docs) {
            messagesModel.add(MessageModel.fromJson(model));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    logoPath,
                    width: 50,
                  ),
                  const Text(
                    "Chat",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: controller,
                      physics: const BouncingScrollPhysics(),
                      itemCount: messagesModel.length,
                      itemBuilder: (context, index) {
                        return (messagesModel[index].id == email)
                            ? MyMessage(
                                model: messagesModel[index],
                              )
                            : OthersMessage(model: messagesModel[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Send Message...',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (messageController.text.isNotEmpty) {
                              messages.add({
                                'message': messageController.text,
                                'time': DateTime.now(),
                                'id': email
                              });
                              messageController.clear();
                              controller.animateTo(
                                  controller.position.minScrollExtent,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.bounceIn);
                            }
                          },
                          icon: const Icon(
                            Icons.send,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(body: Text("data"));
        }
      },
    );
  }
}
