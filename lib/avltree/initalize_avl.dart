import 'package:quiver/collection.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:wise_words/avltree/proverb.dart';

class AvlData extends AvlTreeSet<Proverb> {
  bool done = false;

  AvlData() {
    readTSVFile('assets/data/data_set_test.tsv');
  }

  //read dataset file, async to execute in separate thread
  Future<void> readTSVFile(String filePath) async {
    String data = await rootBundle.loadString(filePath);

    CsvToListConverter converter =
        const CsvToListConverter(fieldDelimiter: '\t'); //using tab as delimiter
    List<List<dynamic>> rowsAsList =
        converter.convert(data); //splits data into 2d array of rows

    //initialize each row as a proverb object
    for (List<dynamic> row in rowsAsList) {
      initProverb(int.parse(row[0].toString()), int.parse(row[1].toString()),
          row[2], row[3], row[4]);
    }

    done = true; //sets true when the file is done reading
  }

  initProverb(int chapter, int verse, String unformatted, String formatted,
      String keywords) {
    List<String> keywordsList =
        keywords.split(','); //splits the keywords into a list

    Proverb proverb =
        Proverb(chapter, verse, unformatted, formatted, keywordsList);

    //adds the proverb into the AVL tree as a node
    super.add(proverb);
  }

  bool isDone() {
    return done;
  }
}
