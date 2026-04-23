import 'package:app_flashcards/flash_cards/data/repositories/deck.repository.dart';
import 'package:mobx/mobx.dart';

part 'add_deck.store.g.dart';

class AddDeckStore = AddDeckStoreBase with _$AddDeckStore;

abstract class AddDeckStoreBase with Store {
  final DeckRepository _repository;

  AddDeckStoreBase(this._repository);

  @observable
  String _newDeckTitle = "";
  String get newDeckTitle => _newDeckTitle;

  @action
  void setNewDeckTitle(String value) => _newDeckTitle = value;

  @action
  Future<void> createDeck() async {
    if (_newDeckTitle.trim().isEmpty) return;

    await _repository.createDeck(_newDeckTitle.trim());
    _newDeckTitle = "";
  }
}
