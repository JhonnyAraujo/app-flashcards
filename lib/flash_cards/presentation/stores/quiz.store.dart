import 'package:app_flashcards/flash_cards/domain/models/deck/deck.model.dart';
import 'package:app_flashcards/flash_cards/domain/models/deck/flash_card.model.dart';
import 'package:mobx/mobx.dart';

part 'quiz.store.g.dart';

class QuizStore = QuizStoreBase with _$QuizStore;

abstract class QuizStoreBase with Store {
  final Deck deck;

  QuizStoreBase(this.deck);

  @observable
  int currentIndex = 0;

  @observable
  bool showAnswer = false;

  @observable
  int correctAnswers = 0;

  @computed
  List<FlashCard> get flashcards => deck.flashCards ?? [];

  @computed
  FlashCard? get currentCard => currentIndex < flashcards.length ? flashcards[currentIndex] : null;

  @computed
  bool get isFinished => flashcards.isEmpty || currentIndex >= flashcards.length;

  @action
  void toggleAnswer() {
    showAnswer = !showAnswer;
  }

  @action
  void markCorrect() {
    correctAnswers++;
    _goToNext();
  }

  @action
  void markIncorrect() {
    _goToNext();
  }

  void _goToNext() {
    currentIndex++;
    showAnswer = false;
  }
}
