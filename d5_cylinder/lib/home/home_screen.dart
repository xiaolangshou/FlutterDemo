import 'package:d5_cylinder/Device/DeviceDetail/feedProcess/feed_rate.dart';
import 'package:d5_cylinder/blocs/coord_detail_bloc.dart';
import 'package:d5_cylinder/blocs/home_detail_bloc.dart';
import 'package:d5_cylinder/home/device_operat_rate.dart';
import 'package:d5_cylinder/home/device_stats_cell.dart';
import 'package:d5_cylinder/home/device_stats_detail.dart';
import 'package:d5_cylinder/res/theme.dart';
import 'package:d5_cylinder/ui/widgets/Dial/DashDefine.dart';
import 'package:d5_cylinder/ui/widgets/Dial/DashDefine.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:d5_cylinder/common/component_index.dart';

//定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

class HomeScreen extends StatefulWidget {
  HomeScreen(GlobalKey key) {
    _globalKey = key;
  }
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color deliverBg = Color.fromARGB(255, 11, 97, 109);
  final Color appBarBg = Color.fromARGB(255, 25, 164, 178);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return BlocProvider(
      bloc: HomeDetailBloc(),
      child: Scaffold(
        backgroundColor: backColor,
        appBar: AppBar(
        title: Text("首页"),
        centerTitle: true, //标题是否居中，默认为false
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[

          Gaps.vGap10,
          /*垂直间隔*/
        DeviceOperationRate(),
          Gaps.vGap10,
          /*垂直间隔*/
      DeviceStatsView(),


        ],
      ),
    ), );
  }


  Widget buildSearchBar(Size size) {
    return Container(
      width: size.width,
      color: appBarBg,
      height: 60.0,
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.white,
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(Icons.search),
            hintText: "Search",
            suffixIcon: Icon(Icons.camera_alt),
          ),
        ),
      ),
    );
  }
}

