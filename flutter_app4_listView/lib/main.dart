import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'model/list_model.dart';
import 'profile1.dart';
import 'profile2.dart';
import 'profile3.dart';
import 'profile4.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}

class Home extends StatelessWidget {

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Image.network(listModels[index].avatar),
            SizedBox(height: 16.0),
            Text(
                listModels[index].title,
                style: Theme.of(context).textTheme.title
            ),
          ],
        ),
      ),
      onTap:() {
        switch (index) {
          case 0:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Profile1(),
            ));
            break;
          case 1:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Profile2(),
            ));
            break;
          case 2:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Profile3(),
            ));
            break;
          case 3:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Profile4(),
            ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Thomas Lau'),
        elevation: 30.0,
      ),
      body: ListView.builder(
        itemCount: listModels.length,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}