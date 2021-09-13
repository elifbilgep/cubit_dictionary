import 'package:bloc_dictionary/business_logic/blocs/dictionary_cubit.dart';
import 'package:bloc_dictionary/business_logic/blocs/dictionary_state.dart';
import 'package:bloc_dictionary/presentation/screens/list/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return BlocListener(
      listener: (context, state) {
        if (state is WordSearchedState && state.words != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ListScreen(words: state.words)));
        }
      },
      bloc: cubit,
      child: Scaffold(
          backgroundColor: Colors.grey.shade800,
          body: cubit.state is WordSearchingState
              ? getLoadingWidget()
              : cubit.state is ErrorState
                  ? getErrorWidget("Some error")
                  : cubit.state is InitialDictionaryState
                      ? getDictionaryFormWidget(context)
                      : Container()),
    );
  }

  getLoadingWidget() {
    return Center(child: CircularProgressIndicator());
  }

  getErrorWidget(String message) {
    return Center(child: Text(message));
  }

  getDictionaryFormWidget(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            Spacer(),
            Text("Dictionary App",
                style: Theme.of(context).textTheme.headline1),
            Text("Search any word you want quickly",
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 8,
                    spreadRadius: 3,
                    color: Colors.grey.shade900)
              ]),
              child: TextField(
                cursorColor: Colors.orange,
                controller: cubit.queryController,
                decoration: InputDecoration(
                    hintText: "Search a word",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 16, color: Colors.grey.shade700),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    prefixIcon: Icon(Icons.search),
                    fillColor: Colors.grey.shade100,
                    filled: true),
              ),
            ),
            Spacer(),
            Container(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: () {
                  cubit.getWordSearched();
                },
                child: Text(
                  "Search",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
