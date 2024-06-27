import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:tp_twitter/app-theme.dart';
import 'auth/login-page.dart';
import 'home/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {


  MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale currentLocal = Locale('en', 'US');

  // Changer de langue
  void changeLang(String countryCode){
    setState(() {
      currentLocal = Locale(countryCode);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // set json file directory
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    return MaterialApp(
      localizationsDelegates: [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,

        //json-file
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('fr', 'FR'),
        const Locale('zh', 'CN')
      ],
      locale: currentLocal,
      title: 'TP Twitter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppTheme.appBarTheme,
        inputDecorationTheme: AppTheme.inputDecorationTheme
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => LoginPage(),
        '/messages' : (context) => HomePage(),
      },
    );
  }
}

