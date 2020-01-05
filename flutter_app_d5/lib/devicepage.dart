import 'package:flutter/material.dart';

void main() => runApp(DevicePage());

class DevicePage extends StatefulWidget {
  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {

  var _titleList = ['设备一', '设备二', '设备三'];
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(_titleList[_selectedIndex], style: TextStyle(color: Colors.black),),
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(text: '设备一'),
              Tab(text: '设备二'),
              Tab(text: '设备三'),
            ],
            onTap: btnTapped,
            indicatorColor: Colors.transparent,
          ),
        ),
        body: TabBarView(children: <Widget>[
          D1(),
          D2(),
          D3(),
        ]),
      ),
    );
  }

  void btnTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class D1 extends StatefulWidget {
  @override
  _D1State createState() => _D1State();
}

class _D1State extends State<D1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class D2 extends StatefulWidget {
  @override
  _D2State createState() => _D2State();
}

class _D2State extends State<D2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
    );
  }
}

class D3 extends StatefulWidget {
  @override
  _D3State createState() => _D3State();
}

class _D3State extends State<D3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
