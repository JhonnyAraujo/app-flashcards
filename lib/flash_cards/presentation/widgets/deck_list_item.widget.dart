import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:flutter/material.dart';

class DeckListItem extends StatelessWidget {
  final Deck deck;
  final VoidCallback onLongPress;
  final VoidCallback onTap;

  const DeckListItem({
    super.key,
    required this.deck,
    required this.onLongPress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
      title: Text(
        deck.title,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
      subtitle: Text(
        "${deck.flashCards?.length ?? '0'} cartões",
        textAlign: TextAlign.center,
      ),
      onTap: onTap,
      onLongPress: onLongPress,
      splashColor: Colors.red,
      shape: const Border(bottom: BorderSide()),
    );
  }
}
