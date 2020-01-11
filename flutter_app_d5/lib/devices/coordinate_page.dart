import 'package:flutter/material.dart';
import 'package:flutter_app_d5/common.dart';

class CoordinatePage extends StatefulWidget {
  @override
  _CoordinatePageState createState() => _CoordinatePageState();
}

class _CoordinatePageState extends State<CoordinatePage>
    with SingleTickerProviderStateMixin {
  var _titleList = ['设备一', '设备二', '设备三'];
  var _selectedIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState_nameList
    super.initState();

    _tabController = new TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(_titleList[_selectedIndex],
            style: TextStyle(color: Colors.black)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Material(
            color: Color.fromRGBO(237, 237, 244, 1.0),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: <Widget>[
                myTab(_titleList[0], 0, _selectedIndex),
                myTab(_titleList[1], 1, _selectedIndex),
                myTab(_titleList[2], 2, _selectedIndex),
              ],
              indicatorColor: Colors.transparent,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CoordinateDetailPage(),
          CoordinateDetailPage(),
          CoordinateDetailPage(),
        ],
      ),
    );
  }
}

class CoordinateDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    var h1 = (height - kToolbarHeight - 48 - 16 - 50) * 0.5;
    var _nameList = ['相对坐标', '绝对坐标', '机械坐标', '剩余移动量'];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: h1,
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    width: width * 0.5,
                    color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: h1 * 0.2,
                          color: Colors.cyanAccent,
                          child: Text(_nameList[0],
                              style: TextStyle(fontSize: 21)),
                          alignment: Alignment.center,
                        ),
                        Container(
                            height: h1 * 0.8, color: Colors.lightBlueAccent),
                      ],
                    )),
                Container(
                    width: width * 0.5,
                    color: Colors.lightGreen,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: h1 * 0.2,
                          color: Colors.lightBlueAccent,
                          child: Text(_nameList[1],
                              style: TextStyle(fontSize: 21)),
                          alignment: Alignment.center,
                        ),
                        Container(height: h1 * 0.8, color: Colors.cyanAccent),
                      ],
                    )),
              ],
            ),
          ),
          Container(
            height: h1,
            color: Colors.lightBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    width: width * 0.5,
                    color: Colors.greenAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            height: h1 * 0.2,
                            color: Colors.lightGreenAccent,
                            child: Text(_nameList[2],
                                style: TextStyle(fontSize: 21)),
                            alignment: Alignment.center),
                        Container(height: h1 * 0.8, color: Colors.greenAccent),
                      ],
                    )),
                Container(
                    width: width * 0.5,
                    color: Colors.cyanAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            height: h1 * 0.2,
                            color: Colors.greenAccent,
                            child: Text(_nameList[3],
                                style: TextStyle(fontSize: 21)),
                            alignment: Alignment.center),
                        Container(
                            height: h1 * 0.8, color: Colors.lightGreenAccent),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
