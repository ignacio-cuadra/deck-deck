import 'package:deck_deck_app/deck_home.dart';
import 'package:flutter/material.dart';

class DecksList extends StatelessWidget {
  const DecksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Lista de barajas")),
        body: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DeckHome()));
                },
                child: const Text("Primera baraja"))
          ],
        ));
  }
}
