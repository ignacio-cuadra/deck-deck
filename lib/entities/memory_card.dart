class MemoryCard {
  late MemoryCardFront front;
  late MemoryCardBack back;
  MemoryCard(
      {required String sentence, required String answare, String? question}) {
    front = MemoryCardFront(sentence: sentence, question: question);
    back = MemoryCardBack(answare: answare);
  }
}

class MemoryCardFront {
  String sentence;
  String? question;
  MemoryCardFront({required this.sentence, this.question});
}

class MemoryCardBack {
  String answare;
  MemoryCardBack({required this.answare});
}
