import 'package:app_flashcards/flash_cards/data/repositories/deck.repository.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'deck_detail.store.g.dart';

// This is the class used by rest of your codebase
class DeckDetailStore = DeckDetailStoreBase with _$DeckDetailStore;

abstract class DeckDetailStoreBase with Store {
  final DeckRepository repository;

  @observable
  Deck currentDeck;

  DeckDetailStoreBase(this.repository, this.currentDeck);

  @computed
  int get flashcardsCount => currentDeck.flashCards?.length ?? 0;

  @action
  Future<void> reloadDeck() async {
    final updatedDeck = await repository.getById(currentDeck.id);
    if (updatedDeck != null) {
      currentDeck = updatedDeck;
    }
  }
}
