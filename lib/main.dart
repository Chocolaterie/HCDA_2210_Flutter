import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP Twitter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HeaderButton extends StatelessWidget {
  String label;

  HeaderButton(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.label,
      style: TextStyle(color: Colors.white),
    );
  }
}

const headerGradient = BoxDecoration(
    gradient: LinearGradient(
        colors: [Color(0xFF3e60ac), Color(0xFF55a4e0)]));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Message"),
        ),
        body: Column(
          children: [
            Container(
              decoration: headerGradient,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HeaderButton("Nouveau"),
                    HeaderButton("Accueil"),
                    HeaderButton("Rechercher"),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
