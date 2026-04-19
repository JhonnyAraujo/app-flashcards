import 'package:flutter/material.dart';

class AddDeck extends StatelessWidget {
  const AddDeck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Novo deck"), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 32,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Qual é o título do seu novo deck?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 56),
              ),
              const TextField(
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  label: Text("Título do deck"),
                  border: OutlineInputBorder(),
                ),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {},
                child: const Text("Adicionar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
