import 'package:deck_deck_app/shared/domain/answer.dart';
import 'package:deck_deck_app/shared/domain/memory_card.dart';

class QuizMemoryCard extends MemoryCard {
  List<Answer> responseHistory = [];

  QuizMemoryCard(
      {required super.sentence,
      required super.answare,
      super.question,
      List<Answer>? responseHistory});

  factory QuizMemoryCard.fromMemoryCard(MemoryCard memoryCard) {
    return QuizMemoryCard(
        sentence: memoryCard.front.sentence,
        answare: memoryCard.back.answare,
        question: memoryCard.front.question);
  }

  putAnsware(Answer answer) {
    responseHistory.add(answer);
  }

  putAnswares(List<Answer> answers) {
    responseHistory.addAll(answers);
  }
}
