import 'package:app_flashcards/flash_cards/data/repositories/deck.repository.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:mobx/mobx.dart';

part 'home.store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

// The store-class
abstract class HomeStoreBase with Store {
  final DeckRepository _repository;

  HomeStoreBase(this._repository);

  final ObservableList<Deck> _decks = ObservableList<Deck>();
  ObservableList<Deck> get decks => _decks;

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @action
  Future<void> loadDecks() async {
    _isLoading = true;

    final result = await _repository.getAll();
    _decks.addAll(result);

    _isLoading = false;
  }
}

// The store-class
