import 'package:deck_deck_app/quiz/widgets/answer_button.dart';
import 'package:deck_deck_app/shared/domain/answer.dart';
import 'package:flutter/material.dart';

@immutable
class BackFooter extends StatelessWidget {
  final Function(AnswerType) answer;
  const BackFooter({super.key, required this.answer});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        AnswerButton(
          icon: Icons.sentiment_dissatisfied_outlined,
          label: "Again",
          time: "<1m",
          onPressed: () {
            answer(AnswerType.again);
          },
        ),
        const Spacer(),
        AnswerButton(
          icon: Icons.sentiment_neutral_outlined,
          label: "Hard",
          time: "<3m",
          onPressed: () {
            answer(AnswerType.hard);
          },
        ),
        const Spacer(),
        AnswerButton(
          icon: Icons.sentiment_satisfied_alt_outlined,
          label: "Good",
          time: "<5m",
          onPressed: () {
            answer(AnswerType.good);
          },
        ),
        const Spacer(),
        AnswerButton(
          icon: Icons.sentiment_very_satisfied_outlined,
          label: "Easy",
          time: "1d",
          onPressed: () {
            answer(AnswerType.easy);
          },
        ),
        const Spacer(),
      ],
    );
  }
}
