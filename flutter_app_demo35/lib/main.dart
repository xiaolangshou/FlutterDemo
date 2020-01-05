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
      home: TabControllerPage(),
    );
  }
}

class TabControllerPage extends StatefulWidget {
  @override
  _TabControllerPageState createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    print('initilizing data...');
    _tabController = new TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      var index = _tabController.index;
      var previousIndex = _tabController.previousIndex;
      print("index: $index");
      print('previousIndex: $previousIndex');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('thomas'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: '设备一',
            ),
            Tab(
              text: '设备二',
            ),
            Tab(
              text: '设备三',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            color: Color(0xffffffff),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(20),
            child: Text(
              'Tabpage 1',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            color: Color(0xffffffff),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(20),
            child: Text(
              'Tabpage 2',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            color: Color(0xffffffff),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(20),
            child: Text(
              'Tabpage 3',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
