import 'dart:convert';

import 'package:d5_cylinder/blocs/bloc_provider.dart';
import 'package:d5_cylinder/blocs/coord_detail_bloc.dart';
import 'package:d5_cylinder/common/LogHelper.dart';
import 'package:d5_cylinder/common/component_index.dart';
import 'package:d5_cylinder/models/coord_detail_model.dart';
import 'package:d5_cylinder/ui/widgets/Dial/DashDefine.dart';
import 'package:flutter/material.dart';
import '../../dialCoordinates.dart';

class CoordDetailDevice extends StatelessWidget {
  String _text;
  double edgle = 10;
  double coordwidth;
  double coordheight;
  Size coordSize;
  final String deviceNo;

  CoordDetailDevice({@required this.deviceNo});

  @override
  Widget build(BuildContext context) {
    final CoordDetailBloc bloc = BlocProvider.of<CoordDetailBloc>(context);

    coordwidth = (MediaQuery.of(context).size.width - edgle * 4) / 2.0;
    coordheight = (MediaQuery.of(context).size.height - 222.0) / 2.0;
    coordSize = Size(coordwidth, coordheight);

    /*绝对坐标*/
    double abs_x;
    double abs_y;
    double abs_z;
    double abs_da;
    /*相对坐标*/
    double rel_x;
    double rel_y;
    double rel_z;
    double rel_da;
    /*机械坐标*/
    double mac_x;
    double mac_y;
    double mac_z;
    double mac_da;
    /*剩余移动量*/
    double dis_x;
    double dis_y;
    double dis_z;
    double dis_da;

    return new SafeArea(
      child: new StreamBuilder(
          initialData: bloc.initData,
          stream: bloc.recvWebsocket,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              _text = "网络不通...";
            } else if (snapshot.hasData) {
              _text = "echo: " + snapshot.data;
              final jsonData = json.decode(snapshot.data);
              CoordDetailModelEntity items =
                  CoordDetailModelEntity.fromJson(jsonData);

              CoordDetailModelFanuc fanuc2;
              CoordDetailModelFanuc fanuc1;
              CoordDetailModelFanuc fanuc4;
              CoordDetailModelFanuc fanuc3;

              var model;

              switch (deviceNo) {
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


              abs_x = model.abs.x;
              abs_y = model.abs.y;
              abs_z = model.abs.z;
              abs_da = model.abs.da;

              rel_x = model.rel.x;
              rel_y = model.rel.y;
              rel_z = model.rel.z;
              rel_da = model.rel.da;

              mac_x = model.mac.x;
              mac_y = model.mac.y;
              mac_z = model.mac.z;
              mac_da = model.mac.da;

              dis_x = model.dis.x;
              dis_y = model.dis.y;
              dis_z = model.dis.z;
              dis_da = model.dis.da;
              print("model.abs====${model.abs.x}  y= ${model.abs.y} z= ${model.abs.z} da=  ${model.abs.da}");


//              abs_x = -700.0;
//              abs_y = -400.0;
//              abs_z = -330.0;
//              abs_da = 0;
//
//              rel_x = -400.5;
//              rel_y = -200.6;
//              rel_z = -200.8;
//              rel_da = 55;
//
//              mac_x = 300.2;
//              mac_y = 200.6;
//              mac_z = 100.9;
//              mac_da = 270.8;
//
//              dis_x = 80.0;
//              dis_y = 80.0;
//              dis_z = 80.0;
//              dis_da = 90.0;

              print(
                  "CoordDetailModelEntity = ${model.abs.x}  CoordDetailModelEntity 长度:items.length");
            }
            return Container(
              padding: EdgeInsets.all(edgle),
              color: backColor,
              child: new ListView(
//                color: backColor,
//                child: Container(
//                  padding: EdgeInsets.all(edgle),
//                  decoration: BoxDecoration(
//                    color: Colors.white,
//                    borderRadius: BorderRadius.only(
//                        topLeft: Radius.circular(10),
//                        topRight: Radius.circular(10),
//                        bottomLeft: Radius.circular(10),
//                        bottomRight: Radius.circular(10)),
//                  ),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        DialCoordinates(
                          x: rel_x,
                          y: rel_y,
                          z: rel_z,
                          da: rel_da,
                          title: "相对坐标",
                          size: coordSize,
                        ),
                        DialCoordinates(
                          x: abs_x,
                          y: abs_y,
                          z: abs_z,
                          da: abs_da,
                          title: "绝对坐标",
                          size: coordSize,
                        ),
                      ],
                    ),
                  ),
                  Gaps.vGap10,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        DialCoordinates(
                          x: mac_x,
                          y: mac_y,
                          z: mac_z,
                          da: mac_da,
                          title: "机械坐标",
                          size: coordSize,
                        ),
                        DialCoordinates(
                          x: dis_x,
                          y: dis_y,
                          z: dis_z,
                          da: dis_da,
                          title: "剩余移动量",
                          size: coordSize,
                        ),
                      ],
                    ),
                  ),
                ],

//                  ),
//                )
              ),
            );
          }),
    );
  }
}
