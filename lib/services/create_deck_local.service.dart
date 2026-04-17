import 'package:app_flashcards/adapters/deck.adapter.dart';
import 'package:app_flashcards/models/deck/deck.model.dart';

class CreateDeckLocalService {
  final IDeckAdapter _deckAdapter;

  CreateDeckLocalService(this._deckAdapter);

  Future<Deck> call(String name) async {
    final deck = Deck(id: DateTime.now().microsecond.toString(), name: name);

    await _deckAdapter.save(deck);
    return deck;
  }
}
