// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizStore on QuizStoreBase, Store {
  Computed<List<FlashCard>>? _$flashcardsComputed;

  @override
  List<FlashCard> get flashcards =>
      (_$flashcardsComputed ??= Computed<List<FlashCard>>(
        () => super.flashcards,
        name: 'QuizStoreBase.flashcards',
      )).value;
  Computed<FlashCard?>? _$currentCardComputed;

  @override
  FlashCard? get currentCard => (_$currentCardComputed ??= Computed<FlashCard?>(
    () => super.currentCard,
    name: 'QuizStoreBase.currentCard',
  )).value;
  Computed<bool>? _$isFinishedComputed;

  @override
  bool get isFinished => (_$isFinishedComputed ??= Computed<bool>(
    () => super.isFinished,
    name: 'QuizStoreBase.isFinished',
  )).value;

  late final _$currentIndexAtom = Atom(
    name: 'QuizStoreBase.currentIndex',
    context: context,
  );

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$showAnswerAtom = Atom(
    name: 'QuizStoreBase.showAnswer',
    context: context,
  );

  @override
  bool get showAnswer {
    _$showAnswerAtom.reportRead();
    return super.showAnswer;
  }

  @override
  set showAnswer(bool value) {
    _$showAnswerAtom.reportWrite(value, super.showAnswer, () {
      super.showAnswer = value;
    });
  }

  late final _$correctAnswersAtom = Atom(
    name: 'QuizStoreBase.correctAnswers',
    context: context,
  );

  @override
  int get correctAnswers {
    _$correctAnswersAtom.reportRead();
    return super.correctAnswers;
  }

  @override
  set correctAnswers(int value) {
    _$correctAnswersAtom.reportWrite(value, super.correctAnswers, () {
      super.correctAnswers = value;
    });
  }

  late final _$QuizStoreBaseActionController = ActionController(
    name: 'QuizStoreBase',
    context: context,
  );

  @override
  void toggleAnswer() {
    final _$actionInfo = _$QuizStoreBaseActionController.startAction(
      name: 'QuizStoreBase.toggleAnswer',
    );
    try {
      return super.toggleAnswer();
    } finally {
      _$QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markCorrect() {
    final _$actionInfo = _$QuizStoreBaseActionController.startAction(
      name: 'QuizStoreBase.markCorrect',
    );
    try {
      return super.markCorrect();
    } finally {
      _$QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markIncorrect() {
    final _$actionInfo = _$QuizStoreBaseActionController.startAction(
      name: 'QuizStoreBase.markIncorrect',
    );
    try {
      return super.markIncorrect();
    } finally {
      _$QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
showAnswer: ${showAnswer},
correctAnswers: ${correctAnswers},
flashcards: ${flashcards},
currentCard: ${currentCard},
isFinished: ${isFinished}
    ''';
  }
}
