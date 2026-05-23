import 'package:app_flashcards/core/colors.dart';
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
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
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
                      Text(
                        'O quiz acabou.\nVocê fez ${store.correctAnswers} ponto(s)',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 36),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        key: const Key("btnVoltar"),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Voltar',
                          style: TextStyle(color: Colors.black),
                        ),
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
                      style: const TextStyle(fontSize: 26),
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
                                  style: const TextStyle(fontSize: 64),
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  card.ans,
                                  style: const TextStyle(fontSize: 64),
                                  textAlign: TextAlign.center,
                                ),
                          TextButton(
                            onPressed: store.toggleAnswer,
                            child: Text(
                              store.showAnswer
                                  ? 'Voltar para pergunta'
                                  : 'Visualizar a resposta',
                              style: const TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          const SizedBox(height: 80),
                          FilledButton(
                            key: const Key("btnAcertei"),
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.green,
                              fixedSize: const Size(250, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: store.markCorrect,
                            child: const Text(
                              'Acertei :)',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          FilledButton(
                            key: const Key("btnErrei"),
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.red,
                              fixedSize: const Size(250, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: store.markIncorrect,
                            child: const Text(
                              'Errei :(',
                              style: TextStyle(fontSize: 20),
                            ),
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
