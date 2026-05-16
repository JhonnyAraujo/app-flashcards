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

  @computed
  List<FlashCard> get flashcards => deck.flashCards ?? [];

  @computed
  FlashCard? get currentCard => currentIndex < flashcards.length ? flashcards[currentIndex] : null;

  @computed
  bool get isFinished => flashcards.isEmpty || currentIndex >= flashcards.length;

  @action
  void revealAnswer() {
    showAnswer = true;
  }

  @action
  void nextCard() {
    currentIndex++;
    showAnswer = false;
  }
}
