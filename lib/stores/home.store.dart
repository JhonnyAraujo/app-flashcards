import 'package:app_flashcards/repositories/deck.repository.dart';
import 'package:mobx/mobx.dart';

part 'home.store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

// The store-class
abstract class HomeStoreBase with Store {
  final DeckRepository _repository;

  HomeStoreBase(this._repository);

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
