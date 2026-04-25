import 'package:app_flashcards/flash_cards/data/adapters/deck.adapter.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';

class GetAllLocalService {
  final IDeckAdapter _deckAdapter;

  GetAllLocalService(this._deckAdapter);

  Future<List<Deck>> call() async {
    return await _deckAdapter.getAll();
  }
}
