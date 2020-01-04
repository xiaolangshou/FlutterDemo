import 'dart:math';

import 'package:d5_cylinder/Device/DeviceDetail/spindleState/ring_progress.dart';
import 'package:d5_cylinder/models/coord_detail_model.dart';
import 'package:d5_cylinder/res/styles.dart';
import 'package:flutter/material.dart';

final double sizeLen = 100;
final TextStyle mystyle = TextStyle(fontSize: 20,color: Colors.black);


class SpindleRingView extends StatefulWidget {
  @override
  final double spindle_speed_rate;/*倍率*/
  final int spload;/*负载率*/
  final int spindlespeed;/*转速*/
  final double UTI;/*稼动率*/

  SpindleRingView({this.spindle_speed_rate,this.spload,this.spindlespeed,this.UTI,});

  SpindleRingViewState createState() => new SpindleRingViewState();
}

class SpindleRingViewState extends State<SpindleRingView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              Gaps.vGap10,
              /*垂直间隔*/
              Text("主轴",style: mystyle,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RingProgress(
                    value: (widget.spindle_speed_rate/100),
                    sizeValue: sizeLen,
                    title: "倍率",
                    maxValue: 1,
                  ),

//                  Gaps.hGap25,
//                  Gaps.hGap25,

                  RingProgress(
                    value: widget.spload/100,
                    sizeValue: sizeLen,
                    title: "负载率",
                    maxValue: 1.0,
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("转速",style: mystyle,),
                  RingProgress(
                    value: widget.spindlespeed/24000,
                    sizeValue: sizeLen,
                    title: "0<PRM<24000",
                    maxValue: 24000,
                  ),
                ],
              ),
//              Gaps.hGap25,
//              Gaps.hGap25,
//              Column(
//                children: <Widget>[
//                  Text("OEE%",style: mystyle,),
//                  RingProgress(
//                    value: Random().nextDouble(),
//                    sizeValue: sizeLen,
//                    title: "0<PRM<24000",
//                    maxValue: 24000,
//                  ),
//                ],
//              ),
              Column(
                children: <Widget>[
                  Text("稼动率%",style: mystyle,),
                  RingProgress(
                    value: widget.UTI,
                    sizeValue: sizeLen,
                    title: "0<PRM<100",
                    maxValue: 100.0,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(SpindleRingView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
