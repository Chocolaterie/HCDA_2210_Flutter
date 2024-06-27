import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class FooterComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("button-fil".i18n(), style: TextStyle(color: Colors.blue),),
          Text("button-notification".i18n(), style: TextStyle(color: Color(0xFF707070))),
          Text("button-message".i18n(), style: TextStyle(color: Color(0xFF707070))),
          Text("button-me".i18n(), style: TextStyle(color: Color(0xFF707070))),
        ],),
    );
  }
}