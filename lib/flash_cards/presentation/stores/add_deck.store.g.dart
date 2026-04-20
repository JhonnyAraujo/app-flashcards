// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_deck.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddDeckStore on AddDeckStoreBase, Store {
  late final _$_newDeckNameAtom = Atom(
    name: 'AddDeckStoreBase._newDeckName',
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
    'AddDeckStoreBase.createDeck',
    context: context,
  );

  @override
  Future<void> createDeck() {
    return _$createDeckAsyncAction.run(() => super.createDeck());
  }

  late final _$AddDeckStoreBaseActionController = ActionController(
    name: 'AddDeckStoreBase',
    context: context,
  );

  @override
  void setNewDeckName(String value) {
    final _$actionInfo = _$AddDeckStoreBaseActionController.startAction(
      name: 'AddDeckStoreBase.setNewDeckName',
    );
    try {
      return super.setNewDeckName(value);
    } finally {
      _$AddDeckStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
