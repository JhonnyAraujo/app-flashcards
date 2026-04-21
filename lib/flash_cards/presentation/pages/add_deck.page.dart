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
  late final TextEditingController tituloController;

  @override
  void initState() {
    super.initState();
    tituloController = TextEditingController();
  }

  @override
  void dispose() {
    tituloController.dispose();
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
                child: TextField(
                  controller: tituloController,
                  decoration: const InputDecoration(
                    focusColor: Colors.black,
                    label: Text("Título do deck"),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  backgroundColor: Colors.black,
                ),
                onPressed: () async {
                  widget.deckStore.setNewDeckName(tituloController.text);

                  await widget.deckStore.createDeck();

                  if (!mounted) return;

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context, true);
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
