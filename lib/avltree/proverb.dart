class Proverb implements Comparable<Proverb>{
  int chapter = 0;
  int verse = 0;
  String unformatted = '';
  String formatted = '';
  List<String> keywords = [];

  Proverb(this.chapter, this.verse, this.unformatted, this.formatted, this.keywords);

  @override
  int compareTo(Proverb other) { //compare verses for inserting
    
    if (chapter != other.chapter) { //compare by chapter first
      return chapter.compareTo(other.chapter);
    } else { //compare by verse next
      return verse.compareTo(other.verse);
    }
  }

  @override
  String toString() {
    return 'Proverb{chapter: $chapter, verse: $verse, unformatted: $unformatted, formatted: $formatted, keywords: $keywords}';
  }
}
