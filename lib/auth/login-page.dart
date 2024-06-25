import 'package:flutter/material.dart';
import 'package:tp_twitter/app-theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Conexion"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "images/background_01.png",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/sign_in_icon.png",
                    color: Colors.white,
                    width: 124,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Connexion",
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                  ),
                  AppTheme.wrapFormPadding(TextField(
                    decoration: InputDecoration(labelText: "Email"),
                  )),
                  AppTheme.wrapFormPadding(TextField(
                    decoration: InputDecoration(labelText: "Mot de passe"),
                    obscureText: true,
                  )),
                  AppTheme.wrapFormPadding(Row(
                    children: [
                      Switch(value: false, onChanged: (value) {}),
                      Text(
                        "Mémorisez mes informations",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text("Se connecter"),
                          )))
                ],
              ),
            )
          ],
        ));
  }
}
