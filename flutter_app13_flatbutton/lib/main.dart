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
      home: ButtuonDemo(),
    );
  }
}

class ButtuonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Widget flatBtnDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          color: Theme.of(context).accentColor,
          child: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textTheme: ButtonTextTheme.primary,
        ),
        SizedBox(width: 16.0,),
        FlatButton.icon(
          color: Colors.grey,
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Thomas Lau'),
        elevation: 0.5,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flatBtnDemo,
          ],
        ),
      ),
    );
  }
}
