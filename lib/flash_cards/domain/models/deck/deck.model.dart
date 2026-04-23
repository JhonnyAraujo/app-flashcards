import 'package:hive_ce/hive.dart';

part 'deck.model.g.dart';

@HiveType(typeId: 0)
class Deck {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List? cards;

  Deck({required this.id, required this.title, this.cards});
}
