import 'package:deck_deck_app/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeckSelector extends StatefulWidget {
  const DeckSelector({super.key});
  @override
  State<DeckSelector> createState() => _DeckSelector();
}

class _DeckSelector extends State<DeckSelector> {
  _Deck deck = _Deck(
      name: "Deck Name",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      pendingCards: 50,
      newCards: 10,
      time: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Choose a deck",
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(children: [
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Icon(Icons.navigate_before, size: 64.0)),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: AppTheme.colors.secondaryBackground,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Icon(Icons.navigate_next, size: 64.0)),
                  const Spacer()
                ]),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  deck.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Text(deck.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppTheme.colors.secondaryText)),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    _Indicator(
                        label: "Pending", value: deck.pendingCards.toString()),
                    const Spacer(),
                    _Indicator(label: "New", value: deck.newCards.toString()),
                    const Spacer(),
                    _Indicator(
                      label: "Time",
                      value: deck.time.toString(),
                      unit: "m",
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 60, right: 60),
                      child: Text("Study")),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {}, child: const Text("Create new deck")),
                const SizedBox(
                  height: 40,
                )
              ],
            )));
  }
}

@immutable
class _Indicator extends StatelessWidget {
  final String label;
  final String value;
  final String? unit;
  const _Indicator({required this.label, required this.value, this.unit});
  @override
  Widget build(BuildContext context) {
    List<Text> valueLabel = [
      Text(value,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold))
    ];
    if (unit != null) {
      valueLabel.add(Text(unit!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)));
    }
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: valueLabel,
        ),
        Text(
          label,
          style: TextStyle(
              color: AppTheme.colors.secondaryText,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

class _Deck {
  String name;
  String description;
  int pendingCards;
  int newCards;
  int time;
  _Deck(
      {required this.name,
      this.description = "",
      this.pendingCards = 0,
      this.newCards = 0,
      this.time = 0});
}
