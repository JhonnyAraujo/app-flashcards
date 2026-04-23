import 'package:app_flashcards/flash_cards/data/adapters/deck.adapter.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';

class CreateDeckLocalService {
  final IDeckAdapter _deckAdapter;

  CreateDeckLocalService(this._deckAdapter);

  Future<Deck> call(String title) async {
    final deck = Deck(id: DateTime.now().microsecond.toString(), title: title);

    await _deckAdapter.save(deck);
    return deck;
  }
}
