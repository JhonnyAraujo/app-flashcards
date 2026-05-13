import 'package:app_flashcards/flash_cards/data/repositories/deck.repository.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:mobx/mobx.dart';

part 'add_flashcard.store.g.dart';

class AddFlashcardStore = AddFlashcardStoreBase with _$AddFlashcardStore;

abstract class AddFlashcardStoreBase with Store {
  final DeckRepository _repository;

  AddFlashcardStoreBase(this._repository, this.currentDeck);

  final Deck currentDeck;

  @action
  Future<void> addFlashcard(String ask, String ans) async {
    await _repository.addFlashCard(currentDeck.id, ask, ans);
  }
}
