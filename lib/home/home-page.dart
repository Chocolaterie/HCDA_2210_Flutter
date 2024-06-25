import 'package:flutter/material.dart';
import 'package:tp_twitter/home/footer.dart';
import 'package:tp_twitter/home/header.dart';
import 'package:tp_twitter/home/tweet-card.dart';

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
