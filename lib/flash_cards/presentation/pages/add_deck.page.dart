import 'package:app_flashcards/core/colors.dart';
import 'package:app_flashcards/flash_cards/presentation/stores/add_deck.store.dart';
import 'package:flutter/material.dart';

class AddDeck extends StatefulWidget {
  final AddDeckStore deckStore;

  const AddDeck({super.key, required this.deckStore});

  @override
  State<AddDeck> createState() => _AddDeckState();
}

class _AddDeckState extends State<AddDeck> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Novo deck"), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 32,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Qual é o título do seu novo deck?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 56),
              ),
              Form(
                key: formKey,
                child: TextFormField(
                  key: const Key("tituloDeck"),
                  controller: titleController,
                  decoration: const InputDecoration(
                    focusColor: primaryColor,
                    label: Text("Título do deck"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              FilledButton(
                key: const Key("btnAdicionarDeck"),
                style: FilledButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  backgroundColor: primaryColor,
                ),
                onPressed: () async {
                  if (formKey.currentState?.validate() == true) {
                    widget.deckStore.setNewDeckTitle(titleController.text);

                    await widget.deckStore.createDeck();

                    if (!mounted) return;

                    Navigator.pop(context, true);
                  }
                },
                child: const Text("Adicionar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
