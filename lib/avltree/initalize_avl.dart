import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:quiver/collection.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:wise_words/avltree/proverb.dart';

class AvlData extends AvlTreeSet<Proverb> {
  bool done = false;
  List<Proverb> data = [];
  List<Proverb> likes = [];
  List<List<dynamic>> proverbsList = [];
  String file = 'data_set.tsv';
  AvlData() {
    readTSVFile();
  }

  //read dataset file, async to execute in separate thread
  Future<void> readTSVFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/data_set_test.tsv';
    final file = File(filePath);

    if (!file.existsSync() || file.length() == 0) {
      final file =
          await rootBundle.loadString('assets/data/data_set.tsv');
      saveFileToDocumentDirectory(file);
      CsvToListConverter converter = const CsvToListConverter(
          fieldDelimiter: '\t'); //using tab as delimiter
      List<List<dynamic>> rowsAsList =
          converter.convert(file); //splits data into 2d array of rows

      //initialize each row as a proverb object
      for (List<dynamic> row in rowsAsList) {
        initProverb(
            int.parse(row[0].toString()),
            int.parse(row[1].toString()),
            int.parse(row[2].toString()),
            row[3],
            row[4],
            row[5],
            bool.parse(row[6].toString().trim()));
      }
      done = true; //sets true when the file is done reading
      //print(super.toList());
      initDataList();
      saveFileToDocumentDirectory(file);
    } else {
      //removeFile();
      final file = await _localFile;

      //Read the file
      final contents = await file.readAsString();
      final lines = contents.split('\n');
      final nonEmptyLines = lines.where((line) => line.isNotEmpty).toList();
      final rowsAsList = nonEmptyLines.map((line) {
        return line.split('\t');
      }).toList();

      //initialize each row as a proverb object
      for (List<dynamic> row in rowsAsList) {
        initProverb(
            int.parse(row[0].toString()),
            int.parse(row[1].toString()),
            int.parse(row[2].toString()),
            row[3],
            row[4],
            row[5],
            bool.parse(row[6].toString().trim()));
      }
      done = true; //sets true when the file is done reading
      //print(super.toList());
      initDataList();
      saveFileToDocumentDirectory(contents);
    }
  }

  initProverb(int id, int chapter, int verse, String unformatted,
      String formatted, String keywords, bool like) {
    List<String> keywordsList =
        keywords.split(','); //splits the keywords into a list

    Proverb proverb =
        Proverb(id, chapter, verse, unformatted, formatted, keywordsList, like);

    //adds the proverb into the AVL tree as a node
    super.add(proverb);
  }

  initDataList() {
    super.forEach((element) {
      data.add(element);
    });
  }

  List<Proverb> getDataList() {
    return data;
  }

  clearLikes() {
    super.forEach((element) {
      element.setLike(false);
    });
  }

  bool isDone() {
    return done;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data_set_test.tsv');
  }

  Future<void> writeFile() async {
    File file = await _localFile;
    await file.writeAsString('');
    for (var element in super.toList()) {
      String line = element.toList().join('\t');
      await file.writeAsString('$line\n', mode: FileMode.append);
    }
    print('done write');
  }

  Future<void> saveFileToDocumentDirectory(String content) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/data_set_test.tsv');
      forEach((element) {
        proverbsList.add(element.toList());
      });
      String newDataString = const ListToCsvConverter(
        fieldDelimiter: '\t',
      ).convert(proverbsList);
      await file.writeAsString(newDataString);
    } catch (e) {
      print('Error saving file: $e');
    }
  }

  Future<void> removeFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/data_set_test.tsv';
      final file = File(filePath);

      if (file.existsSync()) {
        await file.delete();
        print('File removed successfully.');
      } else {
        print('File does not exist. No removal needed.');
      }
    } catch (e) {
      print('Error removing file: $e');
    }
  }
}
