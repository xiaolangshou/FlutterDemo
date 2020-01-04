import 'package:d5_cylinder/blocs/coord_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:d5_cylinder/Device/bottomTabbar.dart';
import 'package:d5_cylinder/common/component_index.dart';
import 'package:d5_cylinder/ui/widgets/Dial/DashDefine.dart';
import 'package:d5_cylinder/Device/DeviceDetail/coord/coord_detail_device.dart';

class DashBoard extends StatefulWidget {

  Function collBlack;
  final selectDeviceIndex;

  DashBoard({Key key,this.collBlack,this.selectDeviceIndex}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new DashBoardState();
  }
}

class DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Choice> _tags = [];
  String appBarTitle = "01";

  final platform = const MethodChannel('com.flutter.lgyw/sensor');
  bool _isGetPressure = false;
  int pressures = 0;
  Size dashBoardSize;
  double tableSpace_y; /*整圆做160等分，每分代表2度*/
  double tableSpace_x; /*整圆做187等分，每分代表1.8度*/
  double tableSpace_da; /*整圆做187等分，每分代表1.8度*/
  double tableSpace_z; /*整圆做88等分，每分代表1.8度*/

  double edgle = 10;
  int _currentIndex = 0; //选中下标

  String jsonKeyStr = "";




  @override
  void initState() {
    super.initState();

    dashBoardSize = new Size(Length, Length);
    tableSpace_y = wholeCirclesRadian / tableCount_y;
    tableSpace_x = wholeCirclesRadian / tableCount_x;
    tableSpace_da = wholeCirclesRadian / tableCount_da;
    tableSpace_z = wholeCirclesRadian / tableCount_z;

    _tabController = new TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _currentIndex = widget.selectDeviceIndex;
    _tabController.animateTo(_currentIndex);
    _tags = <Choice>[
      Choice(title: "01", icon: Icons.settings_system_daydream),
      Choice(title: "02", icon: Icons.settings_input_component),
      Choice(title: "14", icon: Icons.settings_input_antenna),
      Choice(title: "15", icon: Icons.settings_input_antenna)

    ];


  }

  void _handleTabSelection() {
    if (mounted) {
      setState(() {
        appBarTitle = _tags[_tabController.index].title;
        _currentIndex = _tabController.index;

      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("屏幕的宽度：${size.width} 屏幕的高度:${size.height}");

    return BlocProvider(
      bloc: CoordDetailBloc(),
      child: WillPopScope(
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(appBarTitle),
            centerTitle: true,
          ),
          body: Scaffold(
            appBar: bottomTabbar(tabController: _tabController, tags: _tags),
            body: TabBarView(
                controller: _tabController,
                // ignore: missing_return
                children: _tags.map((Choice choise) {

                  return CoordDetailDevice(deviceNo: choise.title,);

                }).toList()),
          ),
        ),
      // ignore: missing_return
      onWillPop: (){
          print("DashBoard 表盘点击返回啦...");
          Navigator.pop(context);
          widget.collBlack();

      },),
    );
  }

}
