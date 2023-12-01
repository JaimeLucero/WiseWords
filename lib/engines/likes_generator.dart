import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/avltree/proverb.dart';

class GenerateLikes {
  AvlData data = AvlData();
  List<Proverb> proverbList = [];

  GenerateLikes(this.data) {
    initDataList();
  }

  List<Proverb> initDataList() {
    for (var proverb in data.getDataList()) {
      if (proverb.ifLike()) {
        proverbList.add(proverb);
      }
    }
    return proverbList;
  }
}
