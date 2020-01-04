import 'dart:math';

import 'package:d5_cylinder/res/styles.dart';
import 'package:flutter/material.dart';

class LineeLectricProgressIndicator extends StatelessWidget {

  double valueProgress2 = Random().nextDouble();
  double valueProgress3 = Random().nextDouble();
  double valueProgress4 = Random().nextDouble();

  double valueMax2 = 80;
  double valueMax3 = 80;
  double valueMax4 = 80;

  String title = "电机温度";
  String valueStr2 = "x伺服轴:";
  String valueStr3 = "y伺服轴:";
  String valueStr4 = "Z伺服轴:";

  Color nomalColors = Colors.blue[100];
  Color alarmColors = Colors.red[200];

  Color disPlayColor1 = Colors.blue[100];
  Color disPlayColor2 = Colors.blue[100];
  Color disPlayColor3 = Colors.blue[100];
  Color disPlayColor4 = Colors.blue[100];

  double lefttextWidth = 60;
  double righttextWidth = 60;

  String typeStr;/*单位类型*/
  LineeLectricProgressIndicator({@required this.title, @required this.valueStr2,@required this.valueProgress2,@required this.valueMax2,@required this.valueStr3,@required this.valueProgress3,@required this.valueMax3,@required this.valueStr4,@required this.valueProgress4,@required this.valueMax4,this.nomalColors,this.alarmColors,this.typeStr});

  @override
  Widget build(BuildContext context) {

    if (nomalColors == null)
      {
        nomalColors = Colors.blue;
      }
    if (alarmColors == null)
    {
      alarmColors = Colors.red[300];
    }

    if (valueProgress2 < 0.8 * valueMax2)
    {
      disPlayColor2 = nomalColors;
    }
    else{
      disPlayColor2 = alarmColors;
    }


    if (valueProgress3 < 0.8* valueMax3)
    {
      disPlayColor3 = nomalColors;
    }
    else{
      disPlayColor3 = alarmColors;
    }
    if (valueProgress4 < 0.8* valueMax4)
    {
      disPlayColor4 = nomalColors;
    }
    else{
      disPlayColor4 = alarmColors;
    }

    print(" valueProgress2:$valueProgress2  valueMax2:$valueMax2 ");


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(title),

//              Gaps.vGap10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: lefttextWidth,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      valueStr2,
                      style: TextStyle(
                          color: Colors.black,),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey[200],
                        value: valueProgress2/valueMax2,
                        /*精确模式，进度20%*/
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(disPlayColor2),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: righttextWidth,
                    child: Text(
                      "$valueProgress2 $typeStr",
                      style: TextStyle(
                          color: Colors.black,),
                    ),
                  ),
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: lefttextWidth,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      valueStr3,
                      style: TextStyle(
                        color: Colors.black,),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey[200],
                        value: valueProgress3/valueMax3,
                        /*精确模式，进度20%*/
                        valueColor:
                        new AlwaysStoppedAnimation<Color>(disPlayColor3),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: righttextWidth,
                    child: Text(
                      "$valueProgress3 $typeStr",
                      style: TextStyle(
                        color: Colors.black,),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: lefttextWidth,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      valueStr4,
                      style: TextStyle(
                        color: Colors.black,),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey[200],
                        value: valueProgress4/valueMax4,
                        /*精确模式，进度20%*/
                        valueColor:
                        new AlwaysStoppedAnimation<Color>(disPlayColor4),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: righttextWidth,
                    child: Text(
                      "$valueProgress4 $typeStr",
                      style: TextStyle(
                        color: Colors.black,),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
