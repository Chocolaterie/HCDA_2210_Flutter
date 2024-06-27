import 'package:flutter/material.dart';
import 'package:tp_twitter/app-theme.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../app-alert-mgr.dart';
import '../app-validators.dart';
import 'auth-context.dart';

class LoginPage extends StatelessWidget {

  var emailController = TextEditingController(text: 'isaac@gmail.com');
  var passwordController = TextEditingController(text: '123456');

  void callApi(BuildContext context) async {
    // Afficher chargement
    AppAlertMgr().showProgress(context, "Tentative de connexion...");

    // Simuler 1 sec de lag
    await Future.delayed(Duration(seconds: 1));

    // Preparer l'url
    var url = Uri.parse("http://localhost:3000/auth");

    // Preparer le header
    // Attention pour envoyer du JSON dans le body il faut le content type json
    final headers =
    {
      'Content-Type' : 'application/json'
    };

    // Le body de la request
    final bodyRequest = convert.json.encode({
      'email' : emailController.text,
      'password' : passwordController.text
    });

    // Appeler l'api
    var response = await http.post(url, headers: headers, body : bodyRequest);

    // convertir le body e njson
    var json = convert.jsonDecode(response.body);

    // Fermer le popup de chargement (dans tout les cas aprés l'API)
    AppAlertMgr().closeProgress();

    // Si erreur token
    if (json['code'] != '203') {
      // Afficher l'erreur metier
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erreur'),
              content: Text(json['message'] as String),
            );
          });
      return;
    }
    // je récupere le token
    // -- stocker le token en cache
    var token = json['data'] as String;
    AuthContext().refreshAuthContext(token);

    // Changer de page
    Navigator.pushNamed(context, "/messages");
  }

  var formKey = GlobalKey<FormState>();

  void onSubmit(BuildContext context) {
    // Enclencher la validation (Controle de surface)
    if (formKey.currentState!.validate()){
      // Appel le metier donc l'api
      callApi(context);
    }
  }

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
              child: Form(
                key: formKey,
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
                    AppTheme.wrapFormPadding(TextFormField(
                      controller: emailController,
                      validator: AppValidator.validateEmail,
                      decoration: InputDecoration(labelText: "Email"),
                    )),
                    AppTheme.wrapFormPadding(TextFormField(
                      controller: passwordController,
                      validator: AppValidator.validatePassword,
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
                            onPressed: () => onSubmit(context),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text("Se connecter"),
                            )))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
