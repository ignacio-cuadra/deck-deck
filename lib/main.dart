import 'package:deck_deck_app/deck_management/screens/deck_selector.dart';
import 'package:deck_deck_app/shared/infrastructure/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DeckDeckApp());
}

class DeckDeckApp extends StatelessWidget {
  const DeckDeckApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeckDeck',
      theme: AppTheme.define(),
      home: const DeckSelector(),
    );
  }
}
