import 'package:app_flashcards/core/colors.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:app_flashcards/flash_cards/presentation/pages/add_deck.page.dart';
import 'package:app_flashcards/flash_cards/presentation/stores/add_deck.store.dart';
import 'package:app_flashcards/flash_cards/presentation/stores/home.store.dart';
import 'package:app_flashcards/flash_cards/presentation/pages/deck_detail.page.dart';
import 'package:app_flashcards/flash_cards/presentation/widgets/deck_list_item.widget.dart';
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
            return store.isLoading
                ? const Center(child: CircularProgressIndicator())
                : store.decks.isEmpty
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            key: Key("image"),
                            image: AssetImage('assets/images/no_decks.png'),
                            width: 350,
                          ),
                          
                          OutlinedButton( key: const Key("btnOutlineAdicionar"), style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 50), side: const BorderSide(color: Colors.black12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))), onPressed: () async {final bool? result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AddDeck(deckStore: AddDeckStore(getIt())),
                            ),
                          );
                          if (result == true) store.loadDecks();}, child: const Text('Adiciona deck', style: TextStyle(color: primaryColor)))
                        ],
                      ),
                    ),
                )
                : ListView.builder(
                    itemCount: store.decks.length,
                    itemBuilder: (context, index) {
                      final Deck deck = store.decks[index];
                      return DeckListItem(
                        deck: deck,
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DeckDetail(deck: deck),
                            ),
                          );
                          store.loadDecks();
                        },
                        onLongPress: () async {
                          await store.deleteDeck(deck.id);
                        },
                      );
                    },
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key("btnAdicionar"),
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
