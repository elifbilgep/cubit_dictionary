import 'dart:io';

import 'package:bloc_dictionary/data/data_providers/http_service.dart';
import 'package:bloc_dictionary/data/models/word.dart';

class WordRepository {
  Future<List<Word>> getWordsFromDictionary(String query) async {
    try {
      final response = await HttpService.getRequest("en_US/$query");

      if (response.statusCode == 200) {
        final result = wordFromJson(response.body);
        return result;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}
