import 'package:app_flashcards/flash_cards/data/adapters/deck.adapter.dart';

class DeleteDeckLocalService {
  final IDeckAdapter _deckAdapter;

  DeleteDeckLocalService(this._deckAdapter);

  Future<void> call(String id) async {
    await _deckAdapter.delete(id);
  }
}
