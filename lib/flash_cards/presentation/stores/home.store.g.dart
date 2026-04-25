// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$_isLoadingAtom = Atom(
    name: 'HomeStoreBase._isLoading',
    context: context,
  );

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$loadDecksAsyncAction = AsyncAction(
    'HomeStoreBase.loadDecks',
    context: context,
  );

  @override
  Future<void> loadDecks() {
    return _$loadDecksAsyncAction.run(() => super.loadDecks());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
