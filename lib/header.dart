import 'package:flutter/material.dart';

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
            HeaderButton("Nouveau"),
            HeaderButton("Accueil"),
            HeaderButton("Rechercher"),
          ],
        ),
      ),
    );
  }
}