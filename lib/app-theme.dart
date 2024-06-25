import 'package:flutter/material.dart';

class AppTheme {
  static var appBarTheme = const AppBarTheme(
      color: Color(0xFF3e60ac),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20));

  static var inputDecorationTheme = InputDecorationTheme(
      labelStyle: TextStyle(color: Color(0xFFD1D1D1)),
      filled: true,
      fillColor: Color(0x55FFFFFF),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none));

  static Widget wrapFormPadding(Widget widget) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10), child: widget);
  }
}
