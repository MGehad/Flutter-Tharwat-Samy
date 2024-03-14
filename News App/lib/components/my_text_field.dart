import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/search_view.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
  });

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: TextField(
        maxLines: 1,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return SearchView(word: controller.text);
                    },
                  ));
                }
              },
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: "Search here..."),
      ),
    );
  }
}
