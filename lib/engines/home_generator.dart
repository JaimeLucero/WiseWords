import 'dart:math';

import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/avltree/proverb.dart';

class GenerateHome {
  AvlData data = AvlData();
  List<int> numbers = [];
  List<Proverb> proverbList = [];

  GenerateHome(this.data) {
    randomizer();
  }

  void randomizer() {
    for (int i = 1; i <= 10; i++) {
      numbers.add(Random().nextInt(202) + 1);
    }
    print(numbers);
  }

  List<Proverb> initDataList() {
    for (var i = 0; i < numbers.length; i++) {
      for (var proverb in data.getDataList()) {
        if (proverb.getId() == numbers[i]) {
          proverbList.add(proverb);
          break;
        }
      }
    }
    return proverbList;
  }
}
