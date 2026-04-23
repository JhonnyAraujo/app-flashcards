import 'package:app_flashcards/core/colors.dart';
import 'package:app_flashcards/flash_cards/presentation/pages/home.page.dart';
import 'package:app_flashcards/injection_container.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDecksDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'FlashCards', home: HomePage());
  }
}
