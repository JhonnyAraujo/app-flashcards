import 'package:app_flashcards/flash_cards/data/adapters/deck.adapter.dart';
import 'package:app_flashcards/flash_cards/data/repositories/deck.repository.dart';
import 'package:app_flashcards/flash_cards/data/services/create_deck_local.service.dart';
import 'package:app_flashcards/flash_cards/data/services/get_all_local.service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDecksDependencies() async {
  final deckAdapter = DeckHiveAdapter();
  await deckAdapter.init();
  getIt.registerLazySingleton<IDeckAdapter>(() => deckAdapter);

  getIt.registerLazySingleton<CreateDeckLocalService>(
    () => CreateDeckLocalService(getIt()),
  );

  getIt.registerLazySingleton<GetAllLocalService>(
    () => GetAllLocalService(getIt()),
  );

  getIt.registerLazySingleton<DeckRepository>(
    () => DeckRepository(createDeckLocal: getIt(), getAllLocalService: getIt()),
  );
}
