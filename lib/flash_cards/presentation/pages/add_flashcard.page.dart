import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:app_flashcards/flash_cards/presentation/stores/add_flashcard.store.dart';
import 'package:app_flashcards/injection_container.dart';
import 'package:flutter/material.dart';

class AddFlashcard extends StatefulWidget {
  final Deck deck;

  const AddFlashcard({super.key, required this.deck});

  @override
  State<AddFlashcard> createState() => _AddFlashcardState();
}

class _AddFlashcardState extends State<AddFlashcard> {
  late final AddFlashcardStore store = AddFlashcardStore(getIt(), widget.deck);

  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  void addFlashcard() {
    store.addFlashcard(questionController.text, answerController.text);
    questionController.clear();
    answerController.clear();
  }

  @override
  void dispose() {
    answerController.dispose();
    questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo cartão'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 60,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Pergunta'),
                ),
                controller: questionController,
              ),
              TextField(
                maxLines: null,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Resposta'),
                ),
                controller: answerController,
              ),
              FilledButton(
                onPressed: addFlashcard,
                child: const Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
