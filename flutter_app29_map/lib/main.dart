import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'rxdart_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: '/rxdart',
      routes: {
        '/rxdart': (context) => RxDartDemo(),
      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

