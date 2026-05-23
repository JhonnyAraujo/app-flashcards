import 'package:app_flashcards/core/colors.dart';
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
  late final AddFlashcardStore store = AddFlashcardStore(
    repository: getIt(),
    currentDeck: widget.deck,
  );

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  void addFlashcard() async {
    if (formKey.currentState?.validate() == true) {
      await store.addFlashcard(questionController.text, answerController.text);
      questionController.clear();
      answerController.clear();
    }
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
          child: Form(
            key: formKey,
            child: Column(
              spacing: 60,
              children: [
                TextFormField(
                  key: const Key("inputPergunta"),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Pergunta'),
                  ),
                  controller: questionController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  key: const Key("inputResposta"),
                  maxLines: null,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Resposta'),
                  ),
                  controller: answerController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                FilledButton(
                  key: const Key("addCardQuestion"),
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                    fixedSize: const Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: addFlashcard,
                  child: const Text(
                    'Adicionar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
