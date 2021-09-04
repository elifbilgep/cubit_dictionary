import 'package:bloc_dictionary/data/models/word.dart';

abstract class DictionaryState {}

class InitialDictionaryState extends DictionaryState {}

class WordSearchingState extends DictionaryState {}

class WordSearchedState extends DictionaryState {
  final List<Word> words;

  WordSearchedState(this.words);
}

class ErrorState extends DictionaryState {
  final message;

  ErrorState(this.message);
}
