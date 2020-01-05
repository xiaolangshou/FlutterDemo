import 'package:flutter/material.dart';
import 'bottom_navigation_bar_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Liu Tao'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState cpreateState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  var _pageController = new PageController(initialPage: 0);

  var pages = <Widget>[
    HomePage1(),
    HomePage2(),
    HomePage3(),
    HomePage4(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Thomas Lau'),
      ),
      body: new PageView.builder(
        onPageChanged: _pageChange,
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return pages.elementAt(_selectedIndex);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('1')),
          BottomNavigationBarItem(icon: Icon(Icons.filter_list), title: Text('2')),
          BottomNavigationBarItem(icon: Icon(Icons.low_priority), title: Text('3')),
          BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text('4')),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.brown,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showToast,
        tooltip: '点击最后一个',
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _onItemTapped(int index) {
    //bottomNavigationBar 和 PageView 关联
    _pageController.animateToPage(index,duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _pageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void showToast() {
//    Fluttertoast.showToast(
//        msg: "选中最后一个",
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
//        backgroundColor: Colors.yellow,
//        textColor: Colors.white,
//        fontSize: 16.0);
    print("---click---");
    _onItemTapped(3);
  }
}

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('1', style: TextStyle(fontSize: 50, color: Colors.red)),
    );
  }
}

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('2', style: TextStyle(fontSize: 50, color: Colors.red)),
    );
  }
}

class HomePage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('3', style: TextStyle(fontSize: 50, color: Colors.red)),
    );
  }
}

class HomePage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('4', style: TextStyle(fontSize: 50, color: Colors.red)),
    );
  }
}
