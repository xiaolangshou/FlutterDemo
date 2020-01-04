import 'dart:convert';
import 'dart:math';
import 'package:d5_cylinder/Device/DeviceDetail/spindleState/line_electric_progress_Indicator.dart';
import 'package:d5_cylinder/Device/DeviceDetail/spindleState/spindle_ring_view.dart';
import 'package:d5_cylinder/blocs/bloc_provider.dart';
import 'package:d5_cylinder/blocs/coord_detail_bloc.dart';
import 'package:d5_cylinder/models/coord_detail_model.dart';
import 'package:d5_cylinder/res/styles.dart';
import 'package:d5_cylinder/ui/widgets/Dial/DashDefine.dart';
import 'package:flutter/material.dart';

import 'line_progress_Indicator.dart';

class SpindleStateScaffold extends StatefulWidget {
  @override
  final String deviceNo;
  SpindleStateScaffold(this.deviceNo);

  _SpindleStateScaffoldState createState() => new _SpindleStateScaffoldState();
}

class _SpindleStateScaffoldState extends State<SpindleStateScaffold> {
  List<CoordDetailModelEntity> _bankList = [];
  List<dynamic> data;

  void _handleButtonPress() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    print("Created the stream");
  }

  @override
  Widget build(BuildContext context) {
    final CoordDetailBloc bloc = BlocProvider.of<CoordDetailBloc>(context);


    return new Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
        child: StreamBuilder(
            initialData: bloc.initData,
            stream: bloc.recvWebsocket,
            builder: (context, snapshot) {
              String text;
              CoordDetailModelFanuc model;

              if (snapshot.hasError) {
                text = "网络不通...";
              } else if (snapshot.hasData) {
                text = "echo: " + snapshot.data;
                final jsonData = json.decode(snapshot.data);
                CoordDetailModelEntity items =
                    CoordDetailModelEntity.fromJson(jsonData);
                switch (widget.deviceNo) {
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
                  default:
                    {
                      model = items.cNC15;
                    }
                    break;
                }
              }

              double spindle_speed_rate = model.spindleSpeedRate == null
                  ? 0
                  : model.spindleSpeedRate; /*倍率*/
              int spload =
                  model.spload == null ? 0 : int.parse(model.spload); /*负载率*/
              int spindlespeed = model.spindlespeed ; /*转速*/
              double utiValue = model.uTI == null ? 0.0 : model.uTI; /*稼动率*/
              //double utiValue = timeStrToSecondValue(model.cncruntime);/*稼动率*/
              CoordDetailModelFanucSpindleTemp spindletemp = model.spindleTemp;/*温度*/
              CoordDetailModelFanucSpindleCurrent spindleCurrent =
                  model.spindleCurrent;/*电流*/

              double maxspindleTemp = 100.0;/*最高温度100*/

              double maxspindleCurren = 100.0;/*最大电流100*/

              double spindletempValueMain =spindletemp.spindleTemp ==null ?0.0:spindletemp.spindleTemp.toDouble();
              double spindletempValueX = spindletemp.servoTempX==null ?0.0:spindletemp.servoTempX.toDouble();
              double spindletempValueY = spindletemp.servoTempY==null ?0.0:spindletemp.servoTempY.toDouble();
              double spindletempValueZ = spindletemp.servoTempZ==null ?0.0:spindletemp.servoTempZ.toDouble();

              double spindleCurrentvalueMain = spindleCurrent.spindleCurrent==null ?0.0:spindleCurrent.spindleCurrent.toDouble();
              double spindleCurrentvalueX = spindleCurrent.servoCurrentX==null ?0.0:spindleCurrent.servoCurrentX.toDouble();
              double spindleCurrentvalueY = spindleCurrent.servoCurrentY==null ?0.0:spindleCurrent.servoCurrentY.toDouble();
              double spindleCurrentvalueZ = spindleCurrent.servoCurrentZ==null ?0.0:spindleCurrent.servoCurrentZ.toDouble();

              return ListView(
                padding: const EdgeInsets.all(8.0),
                children: <Widget>[
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.white,
                    ),
                    child: new SizedBox(
                      child: SpindleRingView(
                        spindle_speed_rate: spindle_speed_rate,
                        spload: spload,
                        spindlespeed: spindlespeed,
                        UTI: utiValue,
                      ),
                    ),
                  ),
                  Gaps.vGap10,
                  /*垂直间隔*/

                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.white,
                    ),
                    child: new SizedBox(
                      height: 30.0,
                      child: LineeLectricProgressIndicator(
                        title: "电流",
//                        valueStr1: "主轴:",
//                        valueProgress1: spindleCurrentvalueMain,
//                        valueMax1: maxspindleCurren,
                        valueStr2: "X伺服轴:",
                        valueProgress2: spindleCurrentvalueX,
                        valueMax2: maxspindleCurren,
                        valueStr3: "Y伺服轴:",
                        valueProgress3: spindleCurrentvalueY,
                        valueMax3: maxspindleCurren,
                        valueStr4: "Z伺服轴:",
                        valueProgress4: spindleCurrentvalueZ,
                        valueMax4: maxspindleCurren,
                        nomalColors: Colors.yellow[500],
                        typeStr: "A",

                      ),
                    ),
                  ),
                  Gaps.vGap10,
                  /*垂直间隔*/
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.white,
                    ),
                    child: new SizedBox(
                      height: 30.0,
                      child: LineProgressIndicator(
                        title: "电机温度",
                        valueStr1: "主轴:",
                        valueProgress1: spindletempValueMain,
                        valueMax1: maxspindleTemp,
                        valueStr2: "X伺服轴:",
                        valueProgress2: spindletempValueX,
                        valueMax2: maxspindleTemp,
                        valueStr3: "Y伺服轴:",
                        valueProgress3: spindletempValueY,
                        valueMax3: maxspindleTemp,
                        valueStr4: "Z伺服轴:",
                        valueProgress4: spindleCurrentvalueZ,
                        valueMax4: maxspindleTemp,
                        typeStr: "°C",
                      ),
                    ),
                  ),
                  Gaps.vGap10,
                ],
              );
            }),
      ),
//      floatingActionButton: new FloatingActionButton(
//          child: new Icon(Icons.refresh), onPressed: _handleButtonPress),
    );
  }


  /*计算稼动率公式，将获取到的cncruntime 除以20小时计算获得*/

  double timeStrToSecondValue(String timeStr) {
//    String str = "1112H54M21S";

  int totalUTI = 72000;
    if (timeStr == null) {
      return 0.0;
    }
    String str = timeStr;
    double formatStr;
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
//          int day = (int.parse(match) / 24).floor();
//          int hour = (int.parse(match) % 24);
          formatStr =  double.parse(match)* 3600;/*小时数据转为秒*/

        } else if (i == 2) {
//          formatStr = "$formatStr:$match";

          formatStr = formatStr + double.parse(match) * 60;/*分钟*/

        } else if (i == 3) {
//          formatStr = "$formatStr:$match";
          formatStr = formatStr + double.parse(match);/*秒*/

        }

        print("Group[$i]: $match  formatStr===>$formatStr");
      }
      print("\n");
    }
    return formatStr / totalUTI;
  }

}
