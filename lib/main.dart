import 'package:flutter/material.dart';
import 'package:tp_twitter/app-theme.dart';
import 'package:tp_twitter/tweet-card.dart';
import 'footer.dart';
import 'header.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppTheme.appBarTheme,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Message"),
        ),
        body: Column(
          children: [
            HeaderComponent(),
            Expanded(
              child: Column(
                children: [
                  TweetCard(),
                ],
              ),
            ),
            FooterComponent(),
          ],
        ));
  }
}
