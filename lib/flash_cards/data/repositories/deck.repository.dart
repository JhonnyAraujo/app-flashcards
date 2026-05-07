import 'package:app_flashcards/flash_cards/data/services/add_flash_card_to_deck_local.service.dart';
import 'package:app_flashcards/flash_cards/data/services/delete_deck_local.service.dart';
import 'package:app_flashcards/flash_cards/data/services/get_all_local.service.dart';
import 'package:app_flashcards/flash_cards/data/services/get_deck_id_local.service.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:app_flashcards/flash_cards/data/services/create_deck_local.service.dart';

class DeckRepository {
  final GetAllLocalService _getAllLocalService;
  final CreateDeckLocalService _createDeckLocal;
  final DeleteDeckLocalService _deleteDeckLocal;
  final AddFlashCardToDeckLocalService _addFlashCardToDeckLocalService;
  final GetDeckIdLocalService _deckIdLocalService;

  DeckRepository({
    required CreateDeckLocalService createDeckLocal,
    required GetAllLocalService getAllLocalService,
    required DeleteDeckLocalService deleteDeckLocal,
    required AddFlashCardToDeckLocalService addFlashCardToDeckLocalService,
    required GetDeckIdLocalService deckIdLocalService,
  }) : _deckIdLocalService = deckIdLocalService,
       _addFlashCardToDeckLocalService = addFlashCardToDeckLocalService,
       _deleteDeckLocal = deleteDeckLocal,
       _createDeckLocal = createDeckLocal,
       _getAllLocalService = getAllLocalService;

  Future<Deck> createDeck(String title) => _createDeckLocal(title);
  Future<List<Deck>> getAll() => _getAllLocalService();
  Future<void> deleteDeck(String id) => _deleteDeckLocal(id);
  Future<void> addFlashCard(String deckId, String ask, String ans) =>
      _addFlashCardToDeckLocalService(deckId: deckId, ask: ask, ans: ans);
  Future<Deck?> getById(String id) => _deckIdLocalService(id);
}
