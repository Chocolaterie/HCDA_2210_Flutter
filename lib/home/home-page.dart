import 'package:flutter/material.dart';
import 'package:tp_twitter/app-alert-mgr.dart';
import 'package:tp_twitter/home/footer.dart';
import 'package:tp_twitter/home/header.dart';
import 'package:tp_twitter/home/tweet-card.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tp_twitter/home/tweet.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tweet> tweets = [];

  /**
   * Va appeler l'api
   */
  void callApi(BuildContext context) async {
    // Afficher chargement
    AppAlertMgr().showProgress(context, "Récupérer des tweets");

    // Simuler 1 sec de lag
    await Future.delayed(Duration(seconds: 1));

    // Preparer l'url
    var url = Uri.parse("https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json");

    // Appeler l'api
    var response = await http.get(url);

    // convertir le body e njson
    var json = convert.jsonDecode(response.body);

    // convertir le json en liste de tweets
    tweets = List<Tweet>.from(json.map((tweetJson) => Tweet.fromJson(tweetJson)).toList());

    // rafraichir la page
    setState(() {});

    // Fermer le popup de chargement
    AppAlertMgr().closeProgress();
  }

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
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => callApi(context),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text("Rafraichir"),
                          ),
                        ),
                      )),
                  Expanded(
                    child: ListView.builder(
                        itemCount: tweets.length,
                        itemBuilder: (BuildContext context, int index) {
                      return TweetCard(tweets[index]);
                    }),
                  ),
                ],
              ),
            ),
            FooterComponent(),
          ],
        ));
  }
}
