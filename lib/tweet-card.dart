import 'package:flutter/material.dart';

const message =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris n";

class TweetCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: 150,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.network(
                        "https://media.tenor.com/-xjD3-jZ61IAAAAM/chemmsuwuowo.gif",
                        width: 145,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Shiba@gmail.com"),
                                Text("56s")
                              ],
                            ),
                            Expanded(child: Text(message))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Répondre"),
                      Text("Retweet"),
                      Text("Favoris"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}