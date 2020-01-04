import 'package:charts_flutter/flutter.dart' as charts;
import 'package:d5_cylinder/common/component_index.dart';
import 'package:d5_cylinder/models/coord_detail_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TimeHourSeriesBar extends StatelessWidget {
  final List<charts.Series<TimeSeriesSales, DateTime>> seriesList;
  final bool animate;
  List<TimeSeriesSales> data = [];
  CoordDetailModelFanuc socketdata;

  TimeHourSeriesBar(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory TimeHourSeriesBar.withSampleData() {
    return new TimeHourSeriesBar(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.

  factory TimeHourSeriesBar.getHourSocketData(
      CoordDetailModelFanuc socketdata) {
    return new TimeHourSeriesBar(_getHourSocketData(socketdata));
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _getHourSocketData(
      CoordDetailModelFanuc socketdata) {
    List<TimeSeriesSales> tempData = [];
    if (socketdata != null) {
      for (int i = 0; i < socketdata.hourcount.length; i++) {
        String timeStr = DateUtil.getDateStrByMs(
            (int.parse(socketdata.hourcount[i].hour) * 1000),
            format: DateFormat.NORMAL);
        var dateAry = timeStr.split(" ");
        var dayAry = dateAry.first.split("-");
        var timeAry = dateAry.last.split(":");
//        timeAry.removeAt(index)
        var temp = TimeSeriesSales(
            new DateTime(
                int.parse(dayAry.first),
                int.parse(dayAry[1]),
                int.parse(dayAry.last),
                int.parse(timeAry.first),
                int.parse(timeAry[1]),
                int.parse(timeAry.last)),
            socketdata.hourcount[i].count);
        tempData.add(temp);
//        print("小时==========>: ${timeStr}    ${socketdata.hourcount[i].hour} ${socketdata.hourcount[i].count}");
      }
    }
    ;
    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'total',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: tempData,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(seriesList,
        animate: animate,
        // Set the default renderer to a bar renderer.
        // This can also be one of the custom renderers of the time series chart.
        defaultRenderer: new charts.BarRendererConfig<DateTime>(),
        // It is recommended that default interactions be turned off if using bar
        // renderer, because the line point highlighter is the default for time
        // series chart.
        defaultInteractions: false,
        // If default interactions were removed, optionally add select nearest
        // and the domain highlighter that are typical for bar charts.
        domainAxis: new charts.DateTimeAxisSpec(
            tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
                hour: new charts.TimeFormatterSpec(
                    format: 'H', transitionFormat: 'H'))),
        primaryMeasureAxis: new charts.NumericAxisSpec(
//          renderSpec: charts.GridlineRendererSpec(
//              lineStyle: charts.LineStyleSpec(/*绘制虚线，间隔8像素*/
//            dashPattern: [8, 8],
//          )),
          tickProviderSpec: /*添加纵轴横线个数*/
              new charts.BasicNumericTickProviderSpec(desiredTickCount: 8),
        ),
        behaviors: [
          new charts.SelectNearest(),
          new charts.DomainHighlighter(),

          new charts.SeriesLegend(
            // Positions for "start" and "end" will be left and right respectively
            // for widgets with a build context that has directionality ltr.
            // For rtl, "start" and "end" will be right and left respectively.
            // Since this example has directionality of ltr, the legend is
            // positioned on the right side of the chart.
            position: charts.BehaviorPosition.top,
            // By default, if the position of the chart is on the left or right of
            // the chart, [horizontalFirst] is set to false. This means that the
            // legend entries will grow as new rows first instead of a new column.
            horizontalFirst: false,
            // This defines the padding around each legend entry.
            cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
            // Set show measures to true to display measures in series legend,
            // when the datum is selected.
            showMeasures: true,
            // Optionally provide a measure formatter to format the measure value.
            // If none is specified the value is formatted as a decimal.
            measureFormatter: (num value) {
              return value == null ? '-' : '${value}';
            },
          ),
        ]
    );
  }


  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 8, 19), 30),
      new TimeSeriesSales(new DateTime(2017, 8, 25), 5),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'total',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
