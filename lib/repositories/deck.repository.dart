import 'package:app_flashcards/models/deck/deck.model.dart';
import 'package:app_flashcards/services/create_deck_local.service.dart';

class DeckRepository {
  final CreateDeckLocalService _createDeckLocal;

  DeckRepository({required CreateDeckLocalService createDeckLocal})
    : _createDeckLocal = createDeckLocal;

  Future<Deck> createDeck(String name) => _createDeckLocal(name);
}
