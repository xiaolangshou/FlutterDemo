import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ResultOverlay(true, () => callAnswerPage()),
    );
  }

  void callAnswerPage() {
    print('aaaaa.......');
  }
}


class ResultOverlay extends StatefulWidget {
  final bool _isCorrect;
  VoidCallback _onTap;

  ResultOverlay(this._isCorrect, this._onTap);

  @override
  _ResultOverlayState createState() => _ResultOverlayState();
}

class _ResultOverlayState extends State<ResultOverlay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new InkWell(
        onTap: () => widget._onTap,
      ),
    );
  }
}
