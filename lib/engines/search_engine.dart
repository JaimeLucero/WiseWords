import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/avltree/proverb.dart';

class SearchEngine {
  String query = '';
  AvlData data;
  List<Proverb> result = [];
  List<int> filter = [];

  SearchEngine(this.query, this.data, this.filter) {
    dataQuery();
  }

  dataQuery() {
    data.forEach((element) {
      if (filter[0] == 0 && filter[1] == 0) {
        if (query != '') {
          if (element.getUnformatted().contains(query) ||
              element.getKeywords().contains(query)) {
            result.add(element);
          }
        } else {
          result.add(element);
        }
      } else if (filter[0] == 0) {
        if (query != '') {
          if (element.getUnformatted().contains(query) ||
              element.getKeywords().contains(query) &&
                  element.getVerse() == filter[1]) {
            result.add(element);
          }
        } else {
          if (element.getVerse() == filter[1]) {
            result.add(element);
          }
        }
      } else if (filter[1] == 0) {
        if (query != '') {
          if (element.getUnformatted().contains(query) ||
              element.getKeywords().contains(query) &&
                  element.getChapter() == filter[0]) {
            result.add(element);
          }
        } else {
          if (element.getChapter() == filter[0]) {
            result.add(element);
          }
        }
      } else {
        if (query != '') {
          if ((element.getUnformatted().contains(query) ||
              element.getKeywords().contains(query)) &&
                  (element.getChapter() == filter[0] && element.getVerse() == filter[1])) {
            result.add(element);
          } 
        } else {
          if (element.getChapter() == filter[0] && element.getVerse() == filter[1]) {
            result.add(element);
          }
        }
      }
    });
  }

  List<Proverb> getResults() {
    print(data.toList());
    return result;
  }
}
