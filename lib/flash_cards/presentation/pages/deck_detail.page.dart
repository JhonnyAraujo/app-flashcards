import 'package:app_flashcards/core/colors.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:app_flashcards/flash_cards/presentation/pages/add_flashcard.page.dart';
import 'package:app_flashcards/flash_cards/presentation/pages/quiz.page.dart';
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
      appBar: AppBar(
        leading: BackButton(
          key: const Key("btnvoltar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        title: Text(widget.deck.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.deck.title, style: const TextStyle(fontSize: 60)),
              Observer(
                builder: (_) => Text(
                  '${store.flashcardsCount} cartões',
                  style: const TextStyle(fontSize: 28),
                ),
              ),
              const SizedBox(height: 100),
              OutlinedButton(
                key: const Key("addCard"),
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(250, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddFlashcard(deck: store.currentDeck),
                    ),
                  );
                  store.reloadDeck();
                },
                child: const Text(
                  'Add Cartão',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              FilledButton(
                key: const Key("startQuiz"),
                style: FilledButton.styleFrom(
                  backgroundColor: primaryColor,
                  fixedSize: const Size(250, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(deck: store.currentDeck),
                    ),
                  );
                },
                child: const Text(
                  'Iniciar Quiz',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
