import 'package:app_flashcards/flash_cards/data/repositories/deck.repository.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:mobx/mobx.dart';

part 'add_flashcard.store.g.dart';

class AddFlashcardStore = AddFlashcardStoreBase with _$AddFlashcardStore;

abstract class AddFlashcardStoreBase with Store {
  final DeckRepository repository;
  final Deck currentDeck;

  AddFlashcardStoreBase({required this.repository, required this.currentDeck});

  @action
  Future<void> addFlashcard(String ask, String ans) async {
    await repository.addFlashCard(currentDeck.id, ask, ans);
  }
}
