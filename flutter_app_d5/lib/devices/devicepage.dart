import 'package:flutter/material.dart';
import 'package:flutter_app_d5/devices/coordinate_page.dart';
import 'package:flutter_app_d5/devices/device_main_page.dart';
import 'package:flutter_app_d5/common.dart';

void main() => runApp(DevicePage());

class DevicePage extends StatefulWidget {
  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage>
    with SingleTickerProviderStateMixin {
  var _titleList = ['设备一', '设备二', '设备三'];
  var _selectedIndex = 0;
  TabController _tabController;

  var d1 = FatherDevice();
  var d2 = FatherDevice();
  var d3 = FatherDevice();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = new TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });

    d1.coordinateBtnTap = () {
      print('push to next view');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => CoordinatePage(),
      ));
    };
    d1.currentBtnTap = () {
      print('push to next view');
    };
    d1.feedRateBtnTap = () {
      print('push to next view');
    };
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
              onTap: btnTapped,
              indicatorColor: Colors.transparent,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          d1,
          d2,
          d3,
        ],
      ),
    );
  }

  void btnTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
