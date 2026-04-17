import 'package:app_flashcards/models/deck/deck.model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

abstract interface class IDeckAdapter {
  Future<void> init();
  Future<void> save(Deck deck);
}

class DeckHiveAdapter implements IDeckAdapter {
  static const String _boxName = "decks";
  late Box<Deck> _box;

  @override
  Future<void> init() async {
    Hive.initFlutter();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(DeckAdapter());
    }

    if (!Hive.isBoxOpen(_boxName)) {
      _box = await Hive.openBox<Deck>(_boxName);
    } else {
      _box = Hive.box<Deck>(_boxName);
    }
  }

  @override
  Future<void> save(Deck deck) async {
    await _box.put(deck.id, deck);
  }
}
