//import 'package:charts_common/common.dart';
import 'package:d5_cylinder/Device/DeviceDetail/spindleState/spindle_state_Detail.dart';
import 'package:d5_cylinder/blocs/coord_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:d5_cylinder/Device/bottomTabbar.dart';
import 'package:d5_cylinder/common/component_index.dart';
import 'package:d5_cylinder/ui/widgets/Dial/DashDefine.dart';


class SpindleStateDetail extends StatefulWidget {


  final Function collBlack;
  final selectDeviceIndex;

  SpindleStateDetail({
    Key key,this.collBlack,
    this.selectDeviceIndex,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new SpindleStateDetailState();
  }
}

class SpindleStateDetailState extends State<SpindleStateDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Choice> _tags = [];
  String appBarTitle = "01";
  double edgle = 10;
  List<dynamic> data;
  int _currentIndex = 0; //选中下标

  @override
  void initState() {
    super.initState();
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

//    Future<String> loadString = DefaultAssetBundle.of(context).loadString("assets/data/smoothline.json");
//    loadString..then((value){
//      print("获取本地json数据:$value");
//      data = json.decode(value);
//
//    });


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

                  return SpindleStateScaffold(choise.title,);

                }).toList()),
          ),
        ),
        // ignore: missing_return
        onWillPop: (){

          // ignore: missing_return
          print("FeedProcessDetail 点击返回啦...");
          Navigator.pop(context);
          widget.collBlack();
        },
      ),
    );
  }
}


class FeedProcessDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(Icons.home),
    );
  }
}


