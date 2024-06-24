import 'package:flutter/material.dart';

class FooterComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Fil", style: TextStyle(color: Colors.blue),),
          Text("Notification", style: TextStyle(color: Color(0xFF707070))),
          Text("Message", style: TextStyle(color: Color(0xFF707070))),
          Text("Moi", style: TextStyle(color: Color(0xFF707070))),
        ],),
    );
  }
}