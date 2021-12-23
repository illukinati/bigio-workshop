import 'package:bigio/views/screens/detail_screen.dart';
import 'package:bigio/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MyNavigator {
  static final routes = <String, WidgetBuilder> {
    '/home': (context) => HomeScreen(),
    '/detail': (context) => DetailScreen(),
  };

  static void goToDetail(BuildContext context) async {
    Navigator.of(context).pushNamed('/detail');
  }
}