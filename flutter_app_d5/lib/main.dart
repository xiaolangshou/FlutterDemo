import 'dart:ui';
import 'mainpage.dart';
import 'devicepage.dart';
import 'settingspage.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  var _pageCon = new PageController(initialPage: 0);

  var pages = <Widget>[
    MainPage(),
    DevicePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(237, 237, 244, 1.0),
        child: new PageView.builder(
          onPageChanged: _pageChange,
          controller: _pageCon,
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            return pages.elementAt(_selectedIndex);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.devices), title: Text('设备')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('设置')),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.deepOrange,
        onTap: _onItemTapped,
      ),
    );
  }

  void _pageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageCon.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
