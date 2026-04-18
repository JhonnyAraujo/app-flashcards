import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Decks", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 20),
              title: Text(
                "Flutter",
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              subtitle: Text("0 cartões", textAlign: TextAlign.center),
              shape: Border(bottom: BorderSide()),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 20),
              title: Text(
                "NodeJS",
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              subtitle: Text("0 cartões", textAlign: TextAlign.center),
              shape: Border(bottom: BorderSide()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: const StadiumBorder(),
        backgroundColor: Colors.black,
        onPressed: () {},
        label: const Text("Adicionar", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
