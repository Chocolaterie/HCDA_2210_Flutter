import 'package:flutter/material.dart';
import 'package:tp_twitter/home/tweet.dart';

const message =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris n";

class TweetCard extends StatelessWidget {

  Tweet tweet;

  TweetCard(this.tweet);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 90,
                child: Row(
                  children: [
                    Image.network(
                      tweet.profile,
                      width: 140,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(tweet.author, style: TextStyle(fontWeight: FontWeight.w800),),
                                Text(tweet.displayDate(), style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey),)
                              ],
                            ),
                          ),
                          Expanded(child: Text(tweet.message, overflow: TextOverflow.ellipsis, maxLines: 3,))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: () {}, icon: Image.asset("images/reply.png", width: 24,)),
                    IconButton(onPressed: () {}, icon: Image.asset("images/retweet.png", width: 24,)),
                    IconButton(onPressed: () {}, icon: Image.asset("images/favorite.png", width: 24,)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}