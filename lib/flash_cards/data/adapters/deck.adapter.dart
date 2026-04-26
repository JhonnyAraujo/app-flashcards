import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

abstract interface class IDeckAdapter {
  Future<void> init();
  Future<List<Deck>> getAll();
  Future<void> save(Deck deck);
  Future<void> delete(String id);
}

class DeckHiveAdapter implements IDeckAdapter {
  static const String _boxName = "decks";
  late Box<Deck> _box;

  @override
  Future<void> init() async {
    await Hive.initFlutter();

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

  @override
  Future<List<Deck>> getAll() async {
    return _box.values.toList();
  }

  @override
  Future<void> delete(String id) async {
    await _box.delete(id);
  }
}
