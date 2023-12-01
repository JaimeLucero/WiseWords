class Proverb implements Comparable<Proverb> {
  int id = 0;
  int chapter = 0;
  int verse = 0;
  String unformatted = '';
  String formatted = '';
  List<String> keywords = [];
  bool like = false;

  Proverb(this.id, this.chapter, this.verse, this.unformatted, this.formatted,
      this.keywords, this.like);

  @override
  int compareTo(Proverb other) {
    //compare verses for inserting

    if (chapter != other.chapter) {
      //compare by chapter first
      return chapter.compareTo(other.chapter);
    } else {
      //compare by verse next
      return verse.compareTo(other.verse);
    }
  }

  int getId() {
    return id;
  }

  int getChapter() {
    return chapter;
  }

  int getVerse() {
    return verse;
  }

  String getUnformatted() {
    return unformatted;
  }

  String getFormatted() {
    return formatted;
  }

  List<String> getKeywords() {
    return keywords;
  }

  bool ifLike() {
    return like;
  }

  setLike(bool like) {
    this.like = like;
  }

  @override
  String toString() {
    return 'Proverb{chapter: $chapter, verse: $verse, unformatted: $unformatted, formatted: $formatted, keywords: $keywords, like: $like}';
  }
}
