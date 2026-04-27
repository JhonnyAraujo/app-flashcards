import 'package:hive_ce_flutter/hive_flutter.dart';

part 'flash_card.model.g.dart';

@HiveType(typeId: 1)
class FlashCard {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String ask;

  @HiveField(2)
  final String ans;

  FlashCard({required this.id, required this.ask, required this.ans});
}
