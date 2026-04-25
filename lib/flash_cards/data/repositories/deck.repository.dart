import 'package:app_flashcards/flash_cards/data/services/get_all_local.service.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:app_flashcards/flash_cards/data/services/create_deck_local.service.dart';

class DeckRepository {
  final GetAllLocalService _getAllLocalService;
  final CreateDeckLocalService _createDeckLocal;

  DeckRepository({
    required CreateDeckLocalService createDeckLocal,
    required GetAllLocalService getAllLocalService,
  }) : _createDeckLocal = createDeckLocal,
       _getAllLocalService = getAllLocalService;

  Future<Deck> createDeck(String title) => _createDeckLocal(title);
  Future<List<Deck>> getAll() => _getAllLocalService();
}
