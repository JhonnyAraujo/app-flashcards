import 'package:app_flashcards/core/colors.dart';
import 'package:app_flashcards/flash_cards/presentation/pages/add_deck.page.dart';
import 'package:app_flashcards/flash_cards/presentation/stores/add_deck.store.dart';
import 'package:app_flashcards/flash_cards/presentation/stores/home.store.dart';
import 'package:app_flashcards/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  final HomeStore store = HomeStore(getIt());

  HomePage({super.key}) {
    store.loadDecks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Decks", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Observer(
          builder: (context) {
            return ListView.builder(
              itemCount: store.decks.length,
              itemBuilder: (context, index) {
                final deck = store.decks[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  title: Text(
                    deck.title,
                    style: const TextStyle(fontSize: 28),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    "${deck.cards?.length ?? '0'} cartões",
                    textAlign: TextAlign.center,
                  ),
                  shape: const Border(bottom: BorderSide()),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: const StadiumBorder(),
        backgroundColor: primaryColor,
        onPressed: () async {
          final bool? result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddDeck(deckStore: AddDeckStore(getIt())),
            ),
          );
          if (result == true) store.loadDecks();
        },
        label: const Text("Adicionar", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
