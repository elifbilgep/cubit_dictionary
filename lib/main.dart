import 'package:bloc_dictionary/business_logic/blocs/dictionary_cubit.dart';
import 'package:bloc_dictionary/business_logic/blocs/dictionary_state.dart';
import 'package:bloc_dictionary/data/repository/word_repository.dart';
import 'package:bloc_dictionary/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
            headline1:
                GoogleFonts.bebasNeue(fontSize: 45, color: Colors.orange),
            bodyText1: GoogleFonts.abel(fontSize: 18, color: Colors.white)),
      ),
      home: BlocProvider<DictionaryCubit>(
        create: (context) => DictionaryCubit(WordRepository()),
        child: Home_Screen(),
      ),
    );
  }
}
