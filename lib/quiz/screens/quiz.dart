import 'dart:async';

import 'package:deck_deck_app/quiz/widgets/back_body.dart';
import 'package:deck_deck_app/quiz/widgets/back_footer.dart';
import 'package:deck_deck_app/quiz/widgets/front_body.dart';
import 'package:deck_deck_app/quiz/widgets/front_footer.dart';
import 'package:deck_deck_app/shared/domain/answer.dart';
import 'package:deck_deck_app/shared/domain/memory_card.dart';
import 'package:deck_deck_app/shared/infrastructure/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:deck_deck_app/shared/domain/deck.dart';

enum Status { front, back }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  Status status = Status.front;
  Deck deck = Deck(name: "Default Deck", cards: [
    MemoryCard(
        sentence: "Hello",
        answare: "Hola",
        question: "How do you say this word in Spanish?")
  ]);
  int seconds = 0;
  late MemoryCard card;
  late Timer _timer;
  _Quiz() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
      });
    });
    card = deck.cards[0];
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void flip() {
    setState(() {
      status = status == Status.front ? Status.back : Status.front;
    });
  }

  void answer(AnswerType asnware) {
    flip();
  }

  @override
  Widget build(BuildContext context) {
    StatelessWidget body = (status == Status.front)
        ? FrontBody(
            memoryCardFront: card.front,
          )
        : BackBody(
            memoryCardBack: card.back,
          );
    StatelessWidget footer = (status == Status.front)
        ? FrontFooter(seconds: seconds, flip: flip)
        : BackFooter(answer: answer);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Daily"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: 0.6,
                color: AppTheme.colors.primary,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 450,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppTheme.colors.secondaryBackground,
                          AppTheme.colors.background,
                        ]),
                    borderRadius: BorderRadius.circular(20)),
                child: body,
              ),
              const Spacer(),
              footer,
              //BackFooter(seconds: 20)
            ],
          ),
        ));
  }
}
