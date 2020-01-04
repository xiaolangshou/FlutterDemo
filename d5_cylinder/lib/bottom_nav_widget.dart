import 'package:d5_cylinder/res/theme.dart';
import 'package:d5_cylinder/store/index.dart';
import 'package:flutter/material.dart';
import 'package:d5_cylinder/home/home_screen.dart';
import 'package:d5_cylinder/Setting/setting_Screen.dart';
import 'package:d5_cylinder/Device/device_list_Screen.dart';
import 'dart:io';
import 'package:d5_cylinder/Setting/me_Screen.dart';

import 'store/models/config_state_model.dart';


class BottomNavWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavWidgetState();
}

enum TabItem {
  home,
  deviceData,
  me,
}

class BottomNavWidgetState extends State<BottomNavWidget> {
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  final bottomNavColor = Colors.indigoAccent;
  int _currentIndex = 0;
  TabItem _currentItem = TabItem.home;

  List<Widget> list = List();

  @override
  void initState() {
    // TODO: implement initState
    list
      ..add(HomeScreen(_globalKey))
      ..add(DeviceListViewScreen())
      ..add(MeControlerView());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget userHeader = UserAccountsDrawerHeader(
      accountName: new Text('Aller_Dong'),
      accountEmail: new Text('Aller_Dong@163.com'),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: NetworkImage(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559793152251&di=85ca8cb42a23f0cb150a32808a396080&imgtype=0&src=http%3A%2F%2Fpic45.nipic.com%2F20140805%2F7447430_145220850000_2.jpg"),
        radius: 35.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "http://img2.ph.126.net/L2YRmNY7w5Pxwzkv1mLYCA==/2662190329746931916.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.green[300].withOpacity(0.6), BlendMode.hardLight)),
      ),
    );

    // TODO: implement build

    return Store.connect<ConfigModel>(builder: (context, child, model) {
      return Scaffold(
        key: _globalKey,
        body: list[_currentIndex],
        bottomNavigationBar: buildBottomNavigationBarMySelf(model),
      );
    });

  }

  /*自定义标签栏*/
  Widget buildBottomNavigationBarMySelf(ConfigModel model) {
    return SafeArea(
        child: SizedBox(
            height: 50.0,
            child: Card(
                color: Platform.isIOS ? Colors.transparent : Colors.white,
                elevation: Platform.isIOS ? 0.0 : 8.0,
                // iphone 无阴影
                shape: RoundedRectangleBorder(),
                margin: EdgeInsets.all(0.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Divider(color: Color(0xFFE0E0E0), height: 0.5),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _buildBottomItem(
                                  icon: Icons.dvr,
                                  text: tabItemName(TabItem.home),
                                  index: 0,model: model),
                              _buildBottomItem(
                                  icon: Icons.business,
                                  text: tabItemName(TabItem.deviceData),
                                  index: 1,model: model),
                              _buildBottomItem(
                                  icon: Icons.perm_identity,
                                  text: tabItemName(TabItem.me),
                                  index: 2,model: model),
                            ]),
                      )
                    ]))));
  }

  Widget _buildBottomItem({IconData icon, String text, int index,ConfigModel model}) {
    Color color = _currentIndex == index ? Color(AppColor.getAppThemeColorData(model.theme).primaryColor) : Colors.grey;
    return Expanded(
        child: InkResponse(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(icon, color: color, size: 22.0),
                  // Image.asset(, color: color, width: 22.0, height: 22.0),
                  Text(text, style: TextStyle(color: color, fontSize: 10.0))
                ]),
            onTap: () => setState(() => _currentIndex = index)));
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _currentItem = TabItem.values[_currentIndex];
    });
  }

// 切换item的颜色，选中用primaryColor，其他都是grey
  Color _colorTabMatching({TabItem item}) {
    return _currentIndex == item ? Theme.of(context).primaryColor : Colors.grey;
  }

  // 跳转侧边栏详情页面
  void _onPageOpen(context, String title) {
    // 关闭侧边栏
    Navigator.pop(context);
    // 跳转页面
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => settingScreen()));
  }
}

String tabItemName(TabItem tabItem) {
  switch (tabItem) {
    case TabItem.home:
      return "首页";
    case TabItem.deviceData:
      return "设备";
    case TabItem.me:
      return "我的";
  }
  return null;
}
