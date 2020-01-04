import 'package:charts_common/common.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:common_utils/common_utils.dart';
import 'package:d5_cylinder/models/coord_detail_model.dart';

import 'package:flutter/material.dart';

import 'dart:math';

class SmoothLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

//  final List websocketData;

  SmoothLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SmoothLineChart.withSampleData() {
    return new SmoothLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory SmoothLineChart.withRandomData() {
    return new SmoothLineChart(_createRandomData());
  }

  factory SmoothLineChart.websocketData(CoordDetailModelFanuc socketdata) {
//    print("websocketData:${socketdata.hourcount}");

    return new SmoothLineChart(_createwebsocketData(socketdata));
  }

  /// Create random data.
  static List<charts.Series<LinearSales, num>> _createRandomData() {
    final random = new Random();

    final data = [
      new LinearSales(0, random.nextInt(100)),
      new LinearSales(1, random.nextInt(100)),
      new LinearSales(2, random.nextInt(100)),
      new LinearSales(3, random.nextInt(100)),
      new LinearSales(4, random.nextInt(100)),
      new LinearSales(5, random.nextInt(100)),
      new LinearSales(6, random.nextInt(100)),
      new LinearSales(7, random.nextInt(100)),
      new LinearSales(8, random.nextInt(100)),
      new LinearSales(9, random.nextInt(100)),
      new LinearSales(10, random.nextInt(100)),
      new LinearSales(11, random.nextInt(100)),
      new LinearSales(12, random.nextInt(100)),
      new LinearSales(13, random.nextInt(100)),
      new LinearSales(14, random.nextInt(100)),
      new LinearSales(15, random.nextInt(100)),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      ),
    ];
  }

  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      seriesList,
      animate: animate,
      defaultRenderer: LineRendererConfig(
        includeArea: true,
//        smoothLine: true,
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 85),
      new LinearSales(1, 25),
      new LinearSales(2, 50),
      new LinearSales(3, 90),
      new LinearSales(4, 30),
      new LinearSales(5, 25),
      new LinearSales(6, 45),
      new LinearSales(7, 80),
      new LinearSales(8, 32),
      new LinearSales(9, 60),
      new LinearSales(10, 88),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearwebsocketData, int>> _createwebsocketData(
      CoordDetailModelFanuc socketdata) {
    final random = new Random();
    var

    data = [
      new LinearwebsocketData(random.nextInt(100), 1,"12:23"),
//      new LinearwebsocketData(random.nextInt(100), 2,"12:28"),
//      new LinearwebsocketData(random.nextInt(100), 3,"12:29"),
//      new LinearwebsocketData(random.nextInt(100), 4,"12:32"),
//      new LinearwebsocketData(random.nextInt(100), 5,"12:35"),
//      new LinearwebsocketData(random.nextInt(100), 6,"12:40"),
//      new LinearwebsocketData(random.nextInt(100), 7,"12:42"),
//      new LinearwebsocketData(random.nextInt(100), 8,"12:50"),
//      new LinearwebsocketData(random.nextInt(100), 9,"13:03"),
//      new LinearwebsocketData(random.nextInt(100), 12,"13:13"),
//      new LinearwebsocketData(random.nextInt(100), 15,"13:18"),
    ];


    if (socketdata != null) {
      List hourtData = socketdata.hourcount;
      data.clear();
      var firstStr = DateUtil.getDateStrByMs((int.parse(socketdata.hourcount.first.hour)*1000),format: DateFormat.HOUR_MINUTE_SECOND);
      var timeAry = firstStr.split(":");
      timeAry.removeAt(0);
      var firstmm = int.parse(timeAry.first);
      var secondss = int.parse(timeAry.last);
      var initgirstvalue = firstmm *60 + secondss;

      for (int i = 0; i < socketdata.hourcount.length; i++) {
        var now = new DateTime.now();
        var a = now.millisecondsSinceEpoch; //时间戳
        var date = DateTime.fromMillisecondsSinceEpoch(
            int.parse(socketdata.hourcount[i].hour));
        String timeStr = DateUtil.getDateStrByMs((int.parse(socketdata.hourcount[i].hour)*1000),format: DateFormat.HOUR_MINUTE_SECOND);
        var timeAry = timeStr.split(":");
        timeAry.removeAt(0);
        int value =  int.parse(timeAry.first)*60 +  int.parse(timeAry.last);
//        var temp = LinearwebsocketData(socketdata.hourcount[i].count, value - initgirstvalue, socketdata.hourcount[i].hour);

        var temp = LinearwebsocketData(socketdata.hourcount[i].count, value - initgirstvalue, socketdata.hourcount[i].hour);


        print("时间：$date  ======timeStr:${timeStr} >>>>>>>${socketdata.hourcount[i].count}  timeAry.first:${timeAry.first}:${timeAry.last} temp====${value - initgirstvalue}",);
        data.add(temp);
      }
    }

    return [
      new charts.Series<LinearwebsocketData, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearwebsocketData sales, _) => sales.count,
        measureFn: (LinearwebsocketData sales, _) => sales.hour,
//        labelAccessorFn: (LinearwebsocketData sales, _) => sales.time,
//        keyFn: (LinearwebsocketData sales, _) => sales.time,
//        overlaySeries: false,
//        displayName: ">>>>><<<<<<",
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

/// Sample linear data type.
class LinearwebsocketData {
  final int hour;
  final int count;
  String time;
  LinearwebsocketData(this.hour, this.count,this.time);
}

