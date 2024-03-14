import 'package:flutter/material.dart';
import '../components/news_list_view_builder.dart';

class SearchView extends StatelessWidget {
  final String word;

  const SearchView({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(word), backgroundColor: Colors.amber,elevation: 0),
      body: CustomScrollView(slivers: [
        NewsListViewBuilder(
          category: "top",
          word: word,
        )
      ]),
    );
  }
}
