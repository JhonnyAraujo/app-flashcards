import 'package:app_flashcards/flash_cards/data/adapters/deck.adapter.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';

class GetDeckIdLocalService {
  final IDeckAdapter _deckAdapter;

  GetDeckIdLocalService(this._deckAdapter);

  Future<Deck?> call(String id) async {
    return await _deckAdapter.getById(id);
  }
}
