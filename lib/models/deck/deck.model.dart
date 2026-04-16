import 'package:hive_ce/hive.dart';

part 'deck.model.g.dart';

@HiveType(typeId: 1)
class Deck {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List? cards;

  Deck({required this.id, required this.name, this.cards});
}
