import 'dart:math';

import 'package:d5_cylinder/common/component_index.dart';
import 'package:d5_cylinder/models/coord_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart/flutter_chart.dart';

class FeedrateView extends StatefulWidget {
  final Size size;
  CoordDetailModelFanuc socketdata;
  FeedrateView({this.size, this.socketdata});

  @override
  _FeedrateViewState createState() => _FeedrateViewState();
}

class _FeedrateViewState extends State<FeedrateView> {
  List<ChartBean> data = [];

  @override
  Widget build (BuildContext context) {
    return Container(child: Padding(
      padding: EdgeInsets.all(4.0), child: _buildChartLine(context),));
  }

  @override
  void initState () {
    // TODO: implement initState
    super.initState();
  }


  List <ChartBean> getSocketData (CoordDetailModelFanuc socketdata) {

    List <ChartBean> tempData = [];
    if (socketdata != null) {
      List hourtData = widget.socketdata.feedspeeddata;
      for (int i = 0; i < widget.socketdata.feedspeeddata.length; i++) {
        String timeStr = DateUtil.getDateStrByMs(
            (int.parse(widget.socketdata.feedspeeddata[i].time)),
            format: DateFormat.DEFAULT);
        var timeAry = timeStr.split(":");
        timeAry.removeAt(0);

        String minStr = double.parse(timeAry.last).ceil().toString();

        String temptimeStr = "${timeAry.first}:${minStr}";

//        print("temp==========>:${widget.socketdata.feedspeeddata[i].count}");
        var temp = ChartBean(x: temptimeStr, y: 0);
        if (widget.socketdata.feedspeeddata[i].count != null){
          temp = ChartBean(x: temptimeStr, y: widget.socketdata.feedspeeddata[i].count.toDouble());
        }
//        print("temp==========>: ${timeStr} ===>${temp.x}  ${temp.y}");
        tempData.add(temp);
      }
    }
    return tempData;
  }

  @override
  ///curve or line
  Widget _buildChartLine(context) {
    data = getSocketData(widget.socketdata);
    var chartLine = ChartLine(
      key: UniqueKey(),/*设置了key才会刷新*/

//      chartBeans: [
//        ChartBean(x: '12:01', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:02', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:03', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:04', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:05', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:06', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:07', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:08', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:09', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:10', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:11', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:12', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:13', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:14', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:15', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:16', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:17', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:18', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:19', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:20', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:21', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:22', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:23', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:24', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:25', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:26', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:27', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:28', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:29', y: Random().nextInt(100).toDouble()),
//        ChartBean(x: '12:30', y: Random().nextInt(100).toDouble()),
//      ],


      chartBeans:data,

      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height / 5 * 1.6),
      isCurve: true,
      lineWidth: 1,
      lineColor: Colors.blue,
      fontColor: Colors.black,
      xyColor: Colors.white12,
      shaderColors: [
        Colors.blue.withOpacity(1.0),
        Colors.blue.withOpacity(0.2)
      ],
      fontSize: 12,
      yNum: 8,
      xNum: 10,
      backgroundColor: Colors.white,
      isAnimation: true,
      duration: Duration(milliseconds: 5),
      isCycle: false,
    );
    return chartLine;
  }


}





