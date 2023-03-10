enum AnswerType { again, hard, good, easy }

class Answer {
  Answer(
      {required AnswerType answare,
      required DateTime dateTime,
      required int responseDelayInSeconds});
}
