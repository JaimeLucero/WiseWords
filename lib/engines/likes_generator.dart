import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/avltree/proverb.dart';

class GenerateLikes {
  AvlData data = AvlData();
  List<Proverb> proverbList = [];

  GenerateLikes(this.data) {
    initDataList();
  }

  List<Proverb> initDataList() {
    proverbList.clear();

    data.forEach((element) {
      if (element.ifLike()) {
        proverbList.add(element);
      }
    });
    return proverbList;
  }
}
