import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:app_flashcards/flash_cards/data/services/create_deck_local.service.dart';

class DeckRepository {
  final CreateDeckLocalService _createDeckLocal;

  DeckRepository({required CreateDeckLocalService createDeckLocal})
    : _createDeckLocal = createDeckLocal;

  Future<Deck> createDeck(String title) => _createDeckLocal(title);
}
