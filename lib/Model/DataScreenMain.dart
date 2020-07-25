import 'CategoryVocab.dart';

class DataScreenMain{
  List<CategoryVocab> listCategory;
  void init(){
    listCategory = List();
    listCategory.add(CategoryVocab(23, 'Animal', 23));
    listCategory.add(CategoryVocab(45, 'Education', 30));
    listCategory.add(CategoryVocab(45, 'Natural', 20));
    listCategory.add(CategoryVocab(23, 'Animal', 23));
    listCategory.add(CategoryVocab(45, 'Education', 30));
    listCategory.add(CategoryVocab(45, 'Natural', 20));
    listCategory.add(CategoryVocab(23, 'Animal', 23));
    listCategory.add(CategoryVocab(45, 'Education', 30));
    listCategory.add(CategoryVocab(45, 'Natural', 20));
  }

}