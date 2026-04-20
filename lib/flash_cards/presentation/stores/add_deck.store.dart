import 'package:app_flashcards/flash_cards/data/repositories/deck.repository.dart';
import 'package:mobx/mobx.dart';

part 'add_deck.store.g.dart';

class AddDeckStore = AddDeckStoreBase with _$AddDeckStore;

abstract class AddDeckStoreBase with Store {
  final DeckRepository _repository;

  AddDeckStoreBase(this._repository);

  @observable
  String _newDeckName = "";
  String get newDeckName => _newDeckName;

  @action
  void setNewDeckName(String value) => _newDeckName = value;

  @action
  Future<void> createDeck() async {
    if (_newDeckName.trim().isEmpty) return;

    await _repository.createDeck(_newDeckName.trim());
    _newDeckName = "";
  }
}
