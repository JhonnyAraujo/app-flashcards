import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:app_flashcards/flash_cards/presentation/stores/quiz.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class QuizPage extends StatefulWidget {
  final Deck deck;
  const QuizPage({super.key, required this.deck});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late final QuizStore store = QuizStore(widget.deck);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz: ${widget.deck.title}'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Observer(
            builder: (_) {
              if (store.isFinished) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'O quiz acabou. Você fez 1 ponto(s)',
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(height: 20),
                      FilledButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Voltar'),
                      ),
                    ],
                  ),
                );
              }

              final card = store.currentCard!;

              return Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '${store.currentIndex + 1}/${store.flashcards.length}',
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (!store.showAnswer)
                              ? Text(
                                  card.ask,
                                  style: const TextStyle(fontSize: 28),
                                  textAlign: TextAlign.center,
                                )
                              : Text(card.ans),
                          TextButton(
                            onPressed: store.revealAnswer,
                            child: const Text('Vizualizar a resposta'),
                          ),

                          const SizedBox(height: 80),
                          FilledButton(
                            onPressed: store.nextCard,
                            child: const Text('Acertei :)'),
                          ),
                          FilledButton(
                            onPressed: store.nextCard,
                            child: const Text('Errei :('),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
