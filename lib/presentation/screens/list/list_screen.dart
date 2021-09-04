import 'package:bloc_dictionary/data/models/word.dart';
import 'package:bloc_dictionary/presentation/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<Word> words;

  const ListScreen({Key key, this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Results",
          style: Theme.of(context)
              .textTheme
              .headline1
              .copyWith(fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade800,
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                word: words[index],
                              )));
                },
                title: Text(
                  "${index + 1})  ${words[index].word}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 24),
                ),
              ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
          itemCount: words.length),
    );
  }
}
