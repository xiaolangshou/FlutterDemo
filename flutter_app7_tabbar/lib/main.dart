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

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.list), onPressed: null),
          title: Text('Thomas'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: null)
          ],
          elevation: 0.0,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.accessibility_new)),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
          Icon(Icons.change_history, size: 128.0, color: Colors.black12),
          Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
          Icon(Icons.accessibility_new, size: 128.0, color: Colors.black12),
        ]),
      ),
    );
  }
}
