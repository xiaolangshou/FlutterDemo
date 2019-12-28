import 'package:flutter/material.dart';
import 'bloc/bloc_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/bloc',
      routes: {
        '/bloc': (context) => BlocDemo(),
      },
    );
  }
}
