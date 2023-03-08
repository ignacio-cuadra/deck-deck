import 'dart:async';

import 'package:deck_deck_app/entities/memory_card.dart';
import 'package:deck_deck_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:deck_deck_app/entities/deck.dart';

class Quiz extends StatefulWidget {
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
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
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
      if (status == Status.front)
        status = Status.back;
      else
        status = Status.front;
    });
  }

  void answer(Answer asnware) {
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
          title: Text("Daily"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: 0.6,
                color: AppTheme.colors.primary,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: body,
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
              ),
              Spacer(),
              footer,
              //BackFooter(seconds: 20)
            ],
          ),
        ));
  }
}

class FrontBody extends StatelessWidget {
  MemoryCardFront memoryCardFront;
  FrontBody({super.key, required this.memoryCardFront});
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Align(
        alignment: Alignment.centerRight,
        child: NewTag(),
      ),
      const Spacer(),
      Text(memoryCardFront.sentence,
          style: TextStyle(
              color: AppTheme.colors.text,
              fontSize: 64,
              fontWeight: FontWeight.bold)),
      const Spacer()
    ];
    if (memoryCardFront.question != null) {
      children.insert(
          2,
          Text(memoryCardFront.question!,
              style: TextStyle(
                  color: AppTheme.colors.secondaryText,
                  fontWeight: FontWeight.w600)));
    }
    return Column(
      children: children,
    );
  }
}

@immutable
class FrontFooter extends StatelessWidget {
  final Function flip;
  final int seconds;
  const FrontFooter({super.key, required this.seconds, required this.flip});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          onPressed: () {
            flip();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 60, right: 60, top: 15, bottom: 15),
            child: Text("Flip"),
          )),
      const SizedBox(
        height: 10,
      ),
      Text(
        "${seconds}s",
        style: TextStyle(color: AppTheme.colors.secondaryText),
      )
    ]);
  }
}

class BackBody extends StatelessWidget {
  MemoryCardBack memoryCardBack;
  BackBody({super.key, required this.memoryCardBack});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: NewTag(),
        ),
        Spacer(),
        Text("Answer",
            style: TextStyle(
                color: AppTheme.colors.secondaryText,
                fontWeight: FontWeight.w600)),
        Text(memoryCardBack.answare,
            style: TextStyle(
                color: AppTheme.colors.text,
                fontSize: 64,
                fontWeight: FontWeight.bold)),
        Spacer()
      ],
    );
  }
}

class BackFooter extends StatelessWidget {
  Function(Answer) answer;
  BackFooter({super.key, required this.answer});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        AnswareButton(
          icon: Icons.sentiment_dissatisfied_outlined,
          label: "Again",
          time: "<1m",
          onPressed: () {
            answer(Answer.again);
          },
        ),
        const Spacer(),
        AnswareButton(
          icon: Icons.sentiment_neutral_outlined,
          label: "Hard",
          time: "<3m",
          onPressed: () {
            answer(Answer.hard);
          },
        ),
        const Spacer(),
        AnswareButton(
          icon: Icons.sentiment_satisfied_alt_outlined,
          label: "Good",
          time: "<5m",
          onPressed: () {
            answer(Answer.good);
          },
        ),
        const Spacer(),
        AnswareButton(
          icon: Icons.sentiment_very_satisfied_outlined,
          label: "Easy",
          time: "1d",
          onPressed: () {
            answer(Answer.easy);
          },
        ),
        const Spacer(),
      ],
    );
  }
}

class AnswareButton extends StatelessWidget {
  IconData icon;
  String label;
  String time;
  Function onPressed;
  AnswareButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.time,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPressed();
        },
        child: Column(
          children: [
            Icon(
              icon,
              size: 64.0,
              color: AppTheme.colors.text,
            ),
            Text(label, style: TextStyle(color: AppTheme.colors.text)),
            Text(time)
          ],
        ));
  }
}

enum Status { front, back }

enum Answer { again, hard, good, easy }

class NewTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppTheme.colors.text,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
        child: Text(
          "new",
          style: TextStyle(
              color: AppTheme.colors.background, fontWeight: FontWeight.bold),
        ));
  }
}
