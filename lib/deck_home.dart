import 'package:flutter/material.dart';

class DeckHome extends StatefulWidget {
  const DeckHome({super.key});
  @override
  State<DeckHome> createState() => _DeckHome();
}

class _DeckHome extends State<DeckHome> {
  List<DeckState> deckStates = [
    DeckState("¡Baraja completada!", Colors.green),
    DeckState("Pendiente", Colors.red)
  ];
  int deckStateIndex = 0;
  List<Option> options = [
    Option("Dirario", Colors.green, () {}),
    Option("Reverso", Colors.orange, () {}),
    Option("Aleatoreo", Colors.blue, () {})
  ];
  int optionIndex = 0;
  int pendingCards = 0;
  int newCards = 15;
  int totalCards = 50;
  int deckCards = 400;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Baraja",
        )),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(deckStates[deckStateIndex].label,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: deckStates[deckStateIndex].color,
                        fontSize: 30)),
                Text(pendingCards.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: deckStates[deckStateIndex].color,
                        fontSize: 50)),
                Text("Pendientes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: deckStates[deckStateIndex].color,
                        fontSize: 16)),
                const Spacer(),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          newCards.toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                        const Text("Nuevas")
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          totalCards.toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                        const Text("Totales")
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          deckCards.toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                        const Text("En Baraja")
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            optionIndex = (optionIndex + 1) % options.length;
                          });
                        },
                        child: Text(
                          "<",
                          style: TextStyle(
                              fontSize: 20, color: options[optionIndex].color),
                        )),
                    const Spacer(),
                    Text(
                      options[optionIndex].label,
                      style: TextStyle(
                          color: options[optionIndex].color,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            optionIndex = (optionIndex - 1) % options.length;
                          });
                        },
                        child: Text(
                          ">",
                          style: TextStyle(
                              fontSize: 20, color: options[optionIndex].color),
                        ))
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Practicar!")),
                const SizedBox(
                  height: 10,
                ),
                TextButton(onPressed: () {}, child: const Text("Opciones")),
              ],
            )));
  }
}

class Option {
  String label;
  Color color;
  Function action;
  Option(this.label, this.color, this.action);
}

class DeckState {
  String label;
  Color color;
  DeckState(this.label, this.color);
}
