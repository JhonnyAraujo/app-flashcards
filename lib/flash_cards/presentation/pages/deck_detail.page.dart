import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:app_flashcards/flash_cards/presentation/pages/add_flashcard.page.dart';
import 'package:app_flashcards/flash_cards/presentation/stores/deck_detail.store.dart';
import 'package:app_flashcards/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DeckDetail extends StatefulWidget {
  final Deck deck;
  const DeckDetail({super.key, required this.deck});

  @override
  State<DeckDetail> createState() => _DeckDetailState();
}

class _DeckDetailState extends State<DeckDetail> {
  late final DeckDetailStore store = DeckDetailStore(getIt(), widget.deck);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.deck.title), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.deck.title),
              Observer(
                builder: (_) => Text('${store.flashcardsCount} cartões'),
              ),
              const SizedBox(height: 100),
              OutlinedButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddFlashcard(deck: widget.deck),
                    ),
                  );
                  store.reloadDeck();
                },
                child: const Text('Add Cartão'),
              ),
              FilledButton(onPressed: () {}, child: const Text('Iniciar Quiz')),
            ],
          ),
        ),
      ),
    );
  }
}
