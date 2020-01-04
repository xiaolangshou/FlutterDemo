//import 'package:charts_common/common.dart';
import 'package:d5_cylinder/blocs/coord_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:d5_cylinder/Device/bottomTabbar.dart';
import 'package:d5_cylinder/common/component_index.dart';
import 'package:d5_cylinder/ui/widgets/Dial/DashDefine.dart';
import 'feed_smooth_Detail.dart';
import 'dart:math';
import 'package:flutter_chart/flutter_chart.dart';

class FeedProcessDetail extends StatefulWidget {
  final Function collBlack;
  final selectDeviceIndex;
  FeedProcessDetail({
    Key key,
    this.collBlack,
    this.selectDeviceIndex
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new FeedProcessDetailState();
  }
}

class FeedProcessDetailState extends State<FeedProcessDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Choice> _tags = [];
  String appBarTitle = "02";
  double edgle = 10;
  List<dynamic> data;
  int _currentIndex = 0; //选中下标


  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _tags = <Choice>[
      Choice(title: "01", icon: Icons.settings_system_daydream),
      Choice(title: "02", icon: Icons.settings_input_component),
      Choice(title: "14", icon: Icons.settings_input_antenna),
      Choice(title: "15", icon: Icons.settings_input_antenna)

    ];
    _currentIndex = widget.selectDeviceIndex;
    _tabController.animateTo(_currentIndex);
    print("选中的是:${_currentIndex}");
  }



  void _handleTabSelection() {
    if (mounted) {
        setState(() {
          appBarTitle = _tags[_tabController.index].title;
          _currentIndex = _tabController.index;
//          _tabController.animateTo(_currentIndex);
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

                  return GalleryScaffold(deviceNo: choise.title,);

                }).toList()),
          ),
        ),
        onWillPop: () {
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

    final CoordDetailBloc bloc = BlocProvider.of<CoordDetailBloc>(context);

    return StreamBuilder(
        initialData:bloc.initData,
      stream: bloc.recvWebsocket,
      builder: (context, snapshot) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: Colors.orange,
          ),
          child: _buildChartLine(context),
        );
      }
    );
  }

  ///curve or line
  Widget _buildChartLine(context) {
    var chartLine = ChartLine(
      key: UniqueKey(),
      chartBeans: [
        ChartBean(x: '12:01', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:02', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:03', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:04', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:05', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:06', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:07', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:08', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:09', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:10', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:11', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:12', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:13', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:14', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:15', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:16', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:17', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:18', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:19', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:20', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:21', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:22', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:23', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:24', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:25', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:26', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:27', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:28', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:29', y: Random().nextInt(100).toDouble()),
        ChartBean(x: '12:30', y: Random().nextInt(100).toDouble()),
      ],
//      size: Size(MediaQuery.of(context).size.width,
//          MediaQuery.of(context).size.height / 5 * 1.6),

      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.width/0.8),

      isCurve: true,
      lineWidth: 2,
      lineColor: Colors.deepPurple,
      fontColor: Colors.red,
      xyColor: Colors.green,
      shaderColors: [Colors.yellow, Colors.lightGreenAccent, Colors.blue],
      fontSize: 12,
      yNum: 8,
      xNum: 6,
      backgroundColor: Colors.white,
      isAnimation: true,
      duration: Duration(milliseconds: 5),
      isCycle: false,
    );

    return chartLine;
  }
}
