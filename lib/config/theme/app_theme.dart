import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white, appBarTheme: const AppBarTheme());
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      color: Colors.white, elevation: 0, centerTitle: true);
}
