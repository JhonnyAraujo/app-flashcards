// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_detail.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeckDetailStore on DeckDetailStoreBase, Store {
  Computed<int>? _$flashcardsCountComputed;

  @override
  int get flashcardsCount => (_$flashcardsCountComputed ??= Computed<int>(
    () => super.flashcardsCount,
    name: 'DeckDetailStoreBase.flashcardsCount',
  )).value;

  late final _$currentDeckAtom = Atom(
    name: 'DeckDetailStoreBase.currentDeck',
    context: context,
  );

  @override
  Deck get currentDeck {
    _$currentDeckAtom.reportRead();
    return super.currentDeck;
  }

  @override
  set currentDeck(Deck value) {
    _$currentDeckAtom.reportWrite(value, super.currentDeck, () {
      super.currentDeck = value;
    });
  }

  late final _$reloadDeckAsyncAction = AsyncAction(
    'DeckDetailStoreBase.reloadDeck',
    context: context,
  );

  @override
  Future<void> reloadDeck() {
    return _$reloadDeckAsyncAction.run(() => super.reloadDeck());
  }

  @override
  String toString() {
    return '''
currentDeck: ${currentDeck},
flashcardsCount: ${flashcardsCount}
    ''';
  }
}
