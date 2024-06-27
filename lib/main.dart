import 'package:flutter/material.dart';
import 'package:tp_twitter/app-theme.dart';
import 'auth/login-page.dart';
import 'home/home-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

