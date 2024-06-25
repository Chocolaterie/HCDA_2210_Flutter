import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  String? iconUrl;
  String? label;

  HeaderButton({this.iconUrl, this.label});

  @override
  Widget build(BuildContext context) {
    // Si icon url (afficher icon button)
    if (this.iconUrl != null){
      return IconButton(onPressed: () {}, icon: Image.asset(this.iconUrl!, width: 24,));
    }
    // sinon par défaut le text
    return Text(
      this.label!,
      style: TextStyle(color: Colors.white),
    );
  }
}

const headerGradient = BoxDecoration(
    gradient: LinearGradient(
        colors: [Color(0xFF3e60ac), Color(0xFF55a4e0)]));

class HeaderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: headerGradient,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HeaderButton(iconUrl: "images/pencil.png"),
            HeaderButton(label: "Accueil"),
            HeaderButton(iconUrl: "images/search.png"),
          ],
        ),
      ),
    );
  }
}