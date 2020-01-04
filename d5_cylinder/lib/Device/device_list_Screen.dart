import 'dart:io';

import 'package:d5_cylinder/Device/DeviceDetail/devicetask/device_task_view.dart';
import 'package:d5_cylinder/blocs/coord_detail_bloc.dart';
import 'package:d5_cylinder/models/coord_detail_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:d5_cylinder/common/component_index.dart';
import 'package:d5_cylinder/Device/DeviceDetail/coord/coord_Detail_Screen.dart';
import 'package:d5_cylinder/Device/DeviceDetail/feedProcess/feed_process_Detail_Screen.dart';
import 'DeviceDetail/spindleState/spindle_state_Detail_Screen.dart';
import 'ImageAndTextBtn.dart';
import 'deviceNature.dart';
import 'bottomTabbar.dart';

final double margin = 10;

class DeviceListViewScreen extends StatefulWidget {
  @override
  _DeviceListViewScreenState createState() => _DeviceListViewScreenState();
}

class _DeviceListViewScreenState extends State<DeviceListViewScreen>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  @override
  TabController _tabController;
  List<Choice> _tags = [];
  String appBarTitle = "01";
  String data;

  AnimationController _controller;

  void changeTitle(int index) {
    setState(() {
      appBarTitle = _tags[index].title;
      print("appBarTitle=====>${appBarTitle}");
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    double width = 160;
    print("打印appBarTitle:$appBarTitle");
    return BlocProvider(
      bloc: CoordDetailBloc(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            centerTitle: true, //标题是否居中，默认为false
          ),
          body: Scaffold(
            appBar: bottomTabbar(tabController: _tabController, tags: _tags),
            body: TabBarView(
                controller: _tabController,
                // ignore: missing_return
                children: _tags.map((Choice choise) {
                  changeTitle(_tabController.index);

                  switch (_tabController.index) {
                    case 0:
                      {
                        return Padding(
                            padding: EdgeInsets.all(margin),
                            child: ChoiseDetail(
                              choice: choise,
                              collBlack: () {
                                print("返回刷新......");
                                CoordDetailBloc().dispose();
                                setState(() {});
                              },
                            ));
                      }
                      break;
                    case 1:
                      {
                        return Padding(
                            padding: EdgeInsets.all(margin),
                            child: ChoiseDetail(
                              choice: choise,
                              collBlack: () {
                                print("返回刷新......");
                                CoordDetailBloc().dispose();
                                setState(() {});
                              },
                            ));
                      }
                      break;
                    case 2:
                      {
                        return Padding(
                            padding: EdgeInsets.all(margin),
                            child: ChoiseDetail(
                              choice: choise,
                              collBlack: () {
                                print("返回刷新......");
                                CoordDetailBloc().dispose();
                                setState(() {});
                              },
                            ));
                      }
                      break;
                    case 3:
                      {
                        return Padding(
                            padding: EdgeInsets.all(margin),
                            child: ChoiseDetail(
                              choice: choise,
                              collBlack: () {
                                print("返回刷新......");
                                CoordDetailBloc().dispose();
                                setState(() {});
                              },
                            ));
                      }
                      break;
                  }
                }).toList()),
          )),
    );
  }

  Color getcolor() {
    return Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255));
  }

  void getData() async {
    String tempdata = await DefaultAssetBundle.of(context)
        .loadString("assets/data/smoothline.json"); //getData()延迟执行后赋值给data
    setState(() {
      data = tempdata;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
    _tabController = new TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _tags = <Choice>[
      Choice(
          title: "01",
          icon: Icons.settings_system_daydream,
          imageName: "jiqiren.png"),
      Choice(
          title: "02",
          icon: Icons.settings_input_component,
          imageName: "jiqiren.png"),
      Choice(
          title: "14",
          icon: Icons.settings_input_antenna,
          imageName: "jiqiren.png"),
      Choice(
          title: "15",
          icon: Icons.settings_input_antenna,
          imageName: "jiqiren.png")
    ];
    _controller = new AnimationController(vsync: this);
  }

  void _handleTabSelection() {
    if (mounted) {
      setState(() {
        appBarTitle = _tags[_tabController.index].title;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }
}

class ChoiseDetail extends StatefulWidget {
  final Choice choice;
  final Function collBlack;

  const ChoiseDetail({
    Key key,
    this.choice,
    this.collBlack,
  }) : super(key: key);

  @override
  _ChoiseDetailState createState() => _ChoiseDetailState();
}

class _ChoiseDetailState extends State<ChoiseDetail> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    final CoordDetailBloc bloc = BlocProvider.of<CoordDetailBloc>(context);

    return SafeArea(

      child:


    //////////////


         StreamBuilder(
            initialData: bloc.initData,
            stream: bloc.recvWebsocket,
            builder: (context, snapshot) {
              int cutterNum = 0;

              String cycletime = ""; /*循环时间*/
              String cncruntime = ""; /*设备运行时间*/
              String cnccuttingtime = ""; /*切割时间*/
              String alarmtime = ""; /*设备异常时间*/
              String cutterTime = ""; /*当前刀具使用时间*/

              if (snapshot.hasError) {
                print("网路不通....");
              } else if (snapshot.hasData) {
                final jsonData = json.decode(snapshot.data);
                CoordDetailModelEntity items =
                CoordDetailModelEntity.fromJson(jsonData);
                CoordDetailModelFanuc model;
                switch (widget.choice.title) {
                  case "01":
                    {
                      model = items.cNC01;
                    }
                    break;
                  case "02":
                    {
                      model = items.cNC02;
                    }
                    break;
                  case "14":
                    {
                      model = items.cNC14;
                    }
                    break;
                  case "15":
                    {
                      model = items.cNC15;
                    }
                    break;
                  default:
                    {
                      model = items.cNC15;
                    }
                    break;
                }
                cutterNum = model.toolNum;

                cycletime = regTimeExpfun(model.cycletime);
                cncruntime = regTimeExpfun(model.cncruntime);
                cnccuttingtime = regTimeExpfun(model.cnccuttingtime);
                alarmtime = regTimeExpfun(model.alarmtime);

                if (cutterNum >= model.tooldata.length) {
                  cutterNum = 0;
                  cutterTime = "0天 0:0:0";
                }
                cutterTime = regTimeExpfun(model.tooldata[cutterNum]);

                print("选中的刀具是:$cutterNum,${model.cycletime}");
              }

              int selectDevice = deviceTitleToindex( widget.choice.title);

              return ListView(
                children: <Widget>[
                  new Row(
                    children: [
                      new Container(
                        width: width / 2.0 - margin,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/machine_bg.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Expanded(
                                child: Column(
                                  children: <Widget>[
                                    new Align(
                                      child: Text(
                                        "3D模型",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      alignment: FractionalOffset(0.5, 0.1),
                                    ),
                                    Center(
                                      child: Image.asset("assets/images/FOXNUM.gif"),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      new Container(
                        width: width / 2.0 - margin,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Align(
                              child: Text(
                                "当前刀号",
                                style: TextStyle(fontSize: 16),
                              ),
                              alignment: FractionalOffset(0.5, 0.1),
                            ),
                            new Align(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset(
                                    Tools.getImgPath("cutter.png"),
                                    width: 100,
                                  ),
                                  new Container(
                                    width: 30,
                                    height: 21,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            Tools.getImgPath("arror_right.png")),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Align(
                                      child: new Text(
                                        cutterNum.toString(),
                                        /*当前刀号*/
                                        style: new TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      alignment: FractionalOffset(0.5, 0.5),
                                    ),
                                  ),
                                ],
                              ),
                              alignment: FractionalOffset.center,
                            ),
                            new Align(
                              child: Text(
                                "已使用:$cutterTime",
                                style: TextStyle(
                                    fontSize: 13, color: TitleBlueColor),
                              ),
                              alignment: FractionalOffset(0.5, 0.9),
                            ),
                            new Align(
                              child: Divider(
                                height: 1.0,
                                color: bgColor,
                                indent: 0.0,
                              ),
                              alignment: FractionalOffset.bottomCenter,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  new Container(
                    color: Colors.white70,
                    height: 120,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("设备运行"),
                            Text(
                              cncruntime,
                              style: TextStyle(color: TitleBlueColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("循环"),
                            Text(
                              cycletime,
                              style: TextStyle(color: TitleBlueColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("次辐轴切削"),
                            Text(
                              cnccuttingtime,
                              style: TextStyle(color: TitleBlueColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "设备异常时间",
                              style: TextStyle(color: TitleRedColor),
                            ),
                            Text(
                              alarmtime,
                              style: TextStyle(color: TitleRedColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  new Align(
                    child: DeviceButtonView(
                        context: context,
                        height: 160,
                        collBlack: (value) {
                          print("选中的是:${value}");
                          switch (value) {
                            case 0:
                              {
                                Navigator.of(context)
                                    .push(new MaterialPageRoute(builder: (_) {
                                  return new DashBoard(
                                    collBlack: () {
                                      widget.collBlack();
                                    },
                                    selectDeviceIndex:selectDevice,
                                  );
                                }));
                              }
                              break;

                            case 1:
                              {
                                Navigator.of(context)
                                    .push(new MaterialPageRoute(builder: (_) {
                                  return new FeedProcessDetail(
                                    collBlack: () {
                                      widget.collBlack();
                                    },selectDeviceIndex:selectDevice,
                                  );
                                }));
                              }
                              break;

                            case 2:
                              {
                                Navigator.of(context)
                                    .push(new MaterialPageRoute(builder: (_) {
                                  return new SpindleStateDetail(selectDeviceIndex:selectDevice,);
                                }));
                              }
                              break;

                            case 3:
                              {
                                Navigator.of(context)
                                    .push(new MaterialPageRoute(builder: (_) {
                                  return new DeviceTaskView(selectDeviceIndex:selectDevice,);
                                }));
                              }
                              break;

                          }
                        }),
                  ),
                ],
              );
            }),

    );
  }

  String regTimeExpfun(String timeStr) {
//    String str = "1112H54M21S";

    if (timeStr == null) {
      return "0天 00:00:00";
    }
    String str = timeStr;
    var formatStr;

    //字符串前加字母"r"，字符串不会解析转义""
    // ignore: valid_regexps
    RegExp reg = new RegExp(r"^(\d*?)H(\d*?)M(\d*?)S$");

    //调用allMatches函数，对字符串应用正则表达式
    //返回包含所有匹配的迭代器
    Iterable<Match> matches = reg.allMatches(str);

    for (Match m in matches) {
      //groupCount返回正则表达式的分组数
      //由于group(0)保存了匹配信息，因此字符串的总长度为：分组数+1
      for (int i = 0; i < m.groupCount + 1; i++) {
        String match = m.group(i);
        if (i == 1) {
          int day = (int.parse(match) / 24).floor();
          int hour = (int.parse(match) % 24);
          formatStr = "$day 天  $hour";
        } else if (i == 2) {
          formatStr = "$formatStr:$match";
        } else if (i == 3) {
          formatStr = "$formatStr:$match";
        }

        print("Group[$i]: $match  formatStr===>$formatStr");
      }
      print("\n");
    }
    return formatStr;
  }
}


int deviceTitleToindex(String title){

  int current = 0;
  switch (title){
    case '01':
      {
        current = 0;
        break;
      }
    case '02':
      {
        current = 1;
        break;
      }
    case '14':
      {
        current = 2;
        break;
      }
    case '15':
      {
        current = 3;
        break;
      }

  }
  return current;

}
