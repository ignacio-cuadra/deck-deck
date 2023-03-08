import 'package:deck_deck_app/entities/memory_card.dart';

class Deck {
  String name;
  String? description;
  List<MemoryCard> cards = [];
  Deck({required this.name, this.description, this.cards = const []});
}
