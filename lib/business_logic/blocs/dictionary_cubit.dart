import 'package:bloc_dictionary/business_logic/blocs/dictionary_state.dart';
import 'package:bloc_dictionary/data/repository/word_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository _wordRepository;

  DictionaryCubit(this._wordRepository) : super(InitialDictionaryState());

  final queryController =
      TextEditingController(); //TextField widgetından aranan kelimeleri burada alıcaz bir TextEditingController ile

  Future getWordSearched() async {
    emit(WordSearchingState());

    try {
      final words =
          await _wordRepository.getWordsFromDictionary(queryController.text);

      if (words == null) {
        emit(ErrorState("There is some issue"));
      } else {
        print(words.toString());
        emit(WordSearchedState(words));
        emit(InitialDictionaryState());
      }
    } on Exception catch (e) {
      print(e);
      emit(ErrorState(e.toString()));
    }
  }
}
