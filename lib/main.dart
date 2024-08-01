import 'package:flutter/material.dart';
import 'package:template/pages/choose_location.dart';
import './pages/home.dart';
import 'package:template/pages/loading.dart';
void main() {
  runApp( MaterialApp(
    initialRoute: "/",
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) =>const ChoiceLocation()
    },
  ));
}