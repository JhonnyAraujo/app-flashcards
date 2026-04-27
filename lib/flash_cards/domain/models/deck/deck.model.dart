import 'package:app_flashcards/flash_cards/domain/models/deck/flash_card.model.dart';
import 'package:hive_ce/hive.dart';

part 'deck.model.g.dart';

@HiveType(typeId: 0)
class Deck {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List<FlashCard>? flashCards;

  Deck({required this.id, required this.title, this.flashCards});
}
