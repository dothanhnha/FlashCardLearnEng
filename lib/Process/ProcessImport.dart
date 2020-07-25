import 'package:cardlearnenglish/Model/Vocabulary.dart';

class ProcessImport{
  String content;
  List<Vocabulary> result;

  ProcessImport({this.content});

  List<Vocabulary>getListVocabulary(){
    List<Vocabulary> result = List();
    for(String line in content.split('\r\n')){
      List<String> listElements = line.split('_');
      result.add(Vocabulary(word: listElements[0], type: listElements[1], mean: listElements[2], example: listElements[3]));
    }
    this.result = result;
    return result;
  }
}