import 'package:flutter/material.dart';
import 'dart:async';

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
      home: SimpleDialogDemo(),
    );
  }
}

enum Option {
  A,
  B,
  C,
  D
}

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {

  String _choice = 'Nothing';

  Future _openSimpleDialog() async {
    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
              title: Text('SimpleDialog'),
              children: <Widget>[
          SimpleDialogOption(
            child: Text('Option A'),
            onPressed: () {
              Navigator.pop(context, Option.A);
            },
          ),
          SimpleDialogOption(
          child: Text('Option B'),
          onPressed: () {
          Navigator.pop(context, Option.B);
          },
          ),
          SimpleDialogOption(
          child: Text('Option C'),
          onPressed: () {
          Navigator.pop(context, Option.C);
          },
          ),
          SimpleDialogOption(
          child: Text('Option D'),
          onPressed: () {
          Navigator.pop(context, Option.D);
          },
          ),
          ],
          );
        }
    );

    switch (option) {
      case Option.A:
        setState(() {
          _choice = 'A';
        });
        break;
      case Option.B:
        setState(() {
          _choice = 'B';
        });
        break;
      case Option.C:
        setState(() {
          _choice = 'C';
        });
        break;
      case Option.D:
        setState(() {
          _choice = 'D';
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple dialog demo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your choice is: $_choice'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _openSimpleDialog,
      ),
    );
  }
}
