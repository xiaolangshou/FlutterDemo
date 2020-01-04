import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:common_utils/common_utils.dart';
import 'package:d5_cylinder/Device/DeviceDetail/devicetask/pce_view.dart';
import 'package:d5_cylinder/blocs/bloc_provider.dart';
import 'package:d5_cylinder/blocs/device_task_block.dart';
import 'package:d5_cylinder/models/device_task_model_entity.dart';
import 'package:d5_cylinder/res/styles.dart';
import 'package:d5_cylinder/res/theme.dart';
import 'package:d5_cylinder/ui/widgets/Dial/DashDefine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:d5_cylinder/blocs/webSocket_initData.dart';

const double marginLen = 8.0;

class DevideTaskDetailView extends StatefulWidget {
  @override
  final String deviceNo;
  DevideTaskDetailView(this.deviceNo);

  _DevideTaskDetailViewState createState() => new _DevideTaskDetailViewState();
}

class _DevideTaskDetailViewState extends State<DevideTaskDetailView> {
  List<DeviceTaskModelEntity> _bankList = [];
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
    final DeviceTaskBloc bloc = BlocProvider.of<DeviceTaskBloc>(context);
    Size size = MediaQuery.of(context).size;

    return new Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
        child: StreamBuilder(
            initialData: bloc.initData,
            stream: bloc.recvWebsocket,
            builder: (context, snapshot) {
              String text;
              DeviceTaskModelEntity model;

              if (snapshot.hasError) {
                text = "网络不通...";
              } else if (snapshot.hasData) {
                text = "echo: " + snapshot.data;

                final jsonData = json.decode(snapshot.data);
                DeviceTaskModelList items =
                    DeviceTaskModelList.fromJson(jsonData);
                print("items.deviceTaskModel[0].devid " +
                    items.deviceTaskModel[0].devid);

                switch (widget.deviceNo) {
                  case "01":
                    {
                      model = items.deviceTaskModel[0];
                    }
                    break;
                  case "02":
                    {
                      model = items.deviceTaskModel[1];
                    }
                    break;
                  case "14":
                    {
                      model = items.deviceTaskModel[2];
                    }
                    break;
                  default:
                    {
                      model = items.deviceTaskModel[3];
                    }
                    break;
                }
              }
              var imageData = model.photo.split(',').last;
              Uint8List bytes = Base64Decoder().convert(imageData);

              var worksheetstatusStr = '未知状态';

              switch (model.worksheet.worksheetstatus) {
                case 1:
                  worksheetstatusStr = '工单加工';
                  break;
                case 2:
                  worksheetstatusStr = '工单暂停中';
                  break;
                case 3:
                  worksheetstatusStr = '工单排配中 ';
                  break;
                case 4:
                  worksheetstatusStr = '无任务';
                  break;
                default:
                  break;
              }

              double columnHeight = 35.0;
              String statusTimeStr = "";
              String predictendtimeStr = "";
              double tempmargin = 30.0;

              double width = (size.width - 16);

              if (model.worksheet.statustime.length >= 7) {
                statusTimeStr = DateUtil.getDateStrByMs(
                    (int.parse(model.worksheet.statustime)),
                    format: DateFormat.MONTH_DAY_HOUR_MINUTE);
              }
              if (model.worksheet.predictendtime.length >= 10) {
                predictendtimeStr = DateUtil.getDateStrByMs(
                    (int.parse(model.worksheet.predictendtime)),
                    format: DateFormat.MONTH_DAY_HOUR_MINUTE);
              }

              return ListView(
                padding: const EdgeInsets.all(marginLen),
                children: <Widget>[
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
//                        Text('联络单号:${model.worksheet.ordernumber}'),

                        titleWidget("联络单号:", '${model.worksheet.ordernumber}',
                            Size(size.width - tempmargin, 25)),
                        titleWidget("工件号:", '${model.worksheet.productname}',
                            Size(size.width - tempmargin, 25)),
                        titleWidget(
                            "后续工单计划:",
                            '${model.worksheet.nextordernumber}',
                            Size(size.width - tempmargin, 25)),
                        titleWidget("治具信息:", '${model.worksheet.jig}',
                            Size(size.width - tempmargin, 25)),
                        titleWidget("检具信息:", '${model.worksheet.gauge1}',
                            Size(size.width - tempmargin, 25)),

//                        SizedBox(height: 8,),

                        Container(
                          height: 200,
                          padding: EdgeInsets.all(12.0),
                          child: new Image.memory(
                            bytes,
                            gaplessPlayback: true,
                            fit: BoxFit.contain,
                            colorBlendMode: BlendMode.colorBurn,
                          ),
                        ),
                      ],
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
                    padding: EdgeInsets.all(marginLen),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            PECwidget('排配数量:', size, columnHeight),
                            buildPCE(model.worksheet.quantity,
                                Size(200, columnHeight)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            PECwidget('已完成数量:', size, columnHeight),
                            buildPCE(model.worksheet.completed,
                                Size(200, columnHeight)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            PECwidget('剩余数量数量:', size, columnHeight),
                            buildPCE(
                                model.worksheet.quantity -
                                    model.worksheet.completed,
                                Size(200, columnHeight)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            PECwidget('设备状态:', size, columnHeight),
                            Text(
                              '${worksheetstatusStr}  ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Text(
                              statusTimeStr,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            PECwidget('预计完成时间:', size, columnHeight),
                            Text(
                              predictendtimeStr,
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Gaps.vGap10,
                  /*垂直间隔*/
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                      Container(
                        height: 50,
                        child: Text("日稼动率",
                          style: TextStyle(color: Colors.black,backgroundColor: Colors.white,fontSize: 16),
                        ),
                      ),
                        buildDayRateGrid(model.dayoee,width,),
                    ],)
                  ),
                  Gaps.vGap10,
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                      Container(
                        height: 50,
                        child: Text("周稼动率",
                          style: TextStyle(color: Colors.black,backgroundColor: Colors.white,fontSize: 16),
                        ),
                      ),
                        buildWeekRateGrid(model.weekoee,width - 40,),
                    ],)
                  ),
                  Gaps.vGap10,
                ],
              );
            }),
      ),
    );
  }

  Widget PECwidget(String title, Size size, double height) {
    return Container(
        alignment: Alignment.center,
//        color: Colors.white10,
        width: size.width - 200 - marginLen * 4,
        height: height,
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ));
  }

  Widget titleWidget(String title, String detail, Size size) {
    return Container(
        padding: EdgeInsets.only(left: 5, right: 5),
//        alignment: Alignment.center,
//        color: Colors.red,
        width: size.width,
        height: size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              detail,
              style: TextStyle(color: Colors.blue,backgroundColor: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}

Widget buildDevice(double total, double num, String title, Size size, Color color) {
  final margin = 8.0;
  var squareHight = ((size.height - 2 * margin) / 2) * num / total;

  return Container(
    padding: EdgeInsets.only(top: margin,bottom: margin),
    width: (size.width ),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("${num}", style: TextStyle(color: Colors.blueGrey,backgroundColor: Colors.white),),
        Container(
          width: size.width /2,
          height: squareHight,
          color: color,
        ),
        SizedBox(height: 5,child: Container(color: Colors.white,),),

        SizedBox(height: 1,child: Container(color: Colors.blue,),),

        SizedBox(height: 5,child: Container(color: Colors.white,),),

        Text(
          title,
          style: TextStyle(color: Colors.black,backgroundColor: Colors.white),
        ),
      ],
    ),
  );
}



Widget buildDayRateGrid(List formList ,double width) {
  List<Widget> tiles = [];//先建一个数组用于存放循环生成的widget
  List  <double> valueList = List <double> ();
  for(Dayoee item in formList) {
    print('item.oee = ${item.oee}');
      valueList.add(item.oee);
   };
  double maxrate = valueList.reduce(max);
  if (maxrate <=0)
    {
      maxrate = 1.0;
    }

  Color defaultColors = Colors.greenAccent;

  print('maxrate======$maxrate');
  Widget content; //单独一个widget组件，用于返回需要生成的内容widget
  for(Dayoee item in formList) {

    if (item.time == "11-13")
    {
      defaultColors = Colors.orange;
    }
    tiles.add(
        buildDevice(
            maxrate, item.oee, item.time, Size(width / 8, 200), defaultColors),
    );
  }
  content = new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
    //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
  );
  return content;
}


Widget buildWeekRateGrid(List formList ,double width) {
  List<Widget> tiles = [];//先建一个数组用于存放循环生成的widget
  List  <double> valueList = List <double> ();
  for(Weekoee item in formList) {
    print('item.oee = ${item.oee}');
      valueList.add(item.oee);
  };
  double maxrate = valueList.reduce(max);
  if (maxrate <=0)
  {
    maxrate = 1.0;
  }
  print('maxrate======$maxrate');
  Widget content; //单独一个widget组件，用于返回需要生成的内容widget
  for(Weekoee item in formList) {
    tiles.add(
      buildDevice(
          maxrate, item.oee, '${item.time}WK', Size(width / 3, 200), Colors.greenAccent),
    );
  }
  content = new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
    //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
  );
  return content;
}