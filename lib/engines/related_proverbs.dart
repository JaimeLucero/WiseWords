import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/avltree/proverb.dart';

class RelatedProverbs {
  AvlData data;
  List<Proverb> related = [];
  Proverb proverb;
  RelatedProverbs(this.data, this.proverb) {
    findRelated();
  }

  findRelated() {
    data.forEach((prov) {
      if (proverb
          .getKeywords()
          .any((keyword) => prov.getUnformatted().contains(keyword)) && prov != proverb) {
        related.add(prov);
      }
    });
  }

  List<Proverb> getRelated() {
    print(data.toList());
    return related;
  }
}
