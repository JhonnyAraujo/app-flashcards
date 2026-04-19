// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$_newDeckNameAtom = Atom(
    name: 'HomeStoreBase._newDeckName',
    context: context,
  );

  @override
  String get _newDeckName {
    _$_newDeckNameAtom.reportRead();
    return super._newDeckName;
  }

  @override
  set _newDeckName(String value) {
    _$_newDeckNameAtom.reportWrite(value, super._newDeckName, () {
      super._newDeckName = value;
    });
  }

  late final _$createDeckAsyncAction = AsyncAction(
    'HomeStoreBase.createDeck',
    context: context,
  );

  @override
  Future<void> createDeck() {
    return _$createDeckAsyncAction.run(() => super.createDeck());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
