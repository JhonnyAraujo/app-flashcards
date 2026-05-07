import 'package:app_flashcards/flash_cards/data/adapters/deck.adapter.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/flash_card.model.dart';

class AddFlashCardToDeckLocalService {
  final IDeckAdapter _deckAdapter;

  AddFlashCardToDeckLocalService(this._deckAdapter);

  Future<void> call({
    required String deckId,
    required String ask,
    required String ans,
  }) async {
    final deck = await _deckAdapter.getById(deckId);

    if (deck != null) {
      final newCard = FlashCard(
        id: DateTime.now().microsecond.toString(),
        ask: ask,
        ans: ans,
      );

      final listaAtualizada = deck.flashCards ?? [];
      listaAtualizada.add(newCard);

      final deckAtulaizado = Deck(
        id: deck.id,
        title: deck.title,
        flashCards: listaAtualizada,
      );

      await _deckAdapter.save(deckAtulaizado);
    }
  }
}
