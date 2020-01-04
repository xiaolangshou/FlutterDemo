import 'package:d5_cylinder/ui/widgets/Dial/DashDefine.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:d5_cylinder/ui/widgets/Dial/DashDefine.dart';

class DialCoordinates extends StatefulWidget {
  @override
  _DialCoordinatesState createState() => _DialCoordinatesState();
  double x;
  double y;
  double z;
  double da;
  String title;
  Size size = Size(200, 200);

  DialCoordinates(
      {Key key,
      @required this.x,
      @required this.y,
      @required this.z,
      @required this.da,
      @required this.title,
      @required this.size})
      : super(key: key);
}

class _DialCoordinatesState extends State<DialCoordinates> {
  Size dashBoardSize;
  double tableSpace_y; /*整圆做160等分，每分代表2度*/
  Picture _pictureBackGround_y;

  double tableSpace_x; /*整圆做187等分，每分代表1.8度*/
  Picture _pictureBackGround_x;

  double tableSpace_da; /*整圆做187等分，每分代表1.9度*/
  Picture _pictureBackGround_da;

  double tableSpace_z; /*整圆做88等分，每分代表1.8度*/
  Picture _pictureBackGround_z;

  Picture _pictureIndicator;

  void initState() {
    super.initState();
    dashBoardSize = new Size(Length, Length);
    tableSpace_y = wholeCirclesRadian / tableCount_y;
    tableSpace_x = wholeCirclesRadian / tableCount_x;
    tableSpace_da = wholeCirclesRadian / tableCount_da;
    tableSpace_z = wholeCirclesRadian / tableCount_z;

    _pictureBackGround_y =
        DashBoardTablePainter_Y(tableSpace_y, dashBoardSize).getBackGround();

    _pictureBackGround_x =
        DashBoardTablePainter_x(tableSpace_x, dashBoardSize).getBackGround();

    _pictureBackGround_da =
        DashBoardTablePainter_DA(tableSpace_da, dashBoardSize).getBackGround();

    _pictureBackGround_z =
        DashBoardTablePainter_Z(tableSpace_z, dashBoardSize).getBackGround();

    _pictureIndicator = IndicatorPainter(dashBoardSize).drawIndicator();
  }

  @override
  Widget build(BuildContext context) {

    print(" 数据指针widget.x== ${widget.x}");
    print(" 数据指针widget.y== ${widget.y}");
    print(" 数据指针widget.z== ${widget.z}");
    print(" 数据指针widget.da== ${widget.da}");


    return Container(
      width: widget.size.width,
      height: widget.size.height,
//      color: Colors.grey,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new CustomPaint(
                size: dashBoardSize,
                painter: new DashBoardIndicatorPainter_x(widget.x, tableSpace_x,
                    _pictureBackGround_x, _pictureIndicator),
              ),
              new CustomPaint(
                size: dashBoardSize,
                painter:
                    new prefix0.DashBoardIndicatorPainter_Y(
                        speeds: widget.y,
                        tableSpace: tableSpace_y,
                        pictureIndicator: _pictureIndicator,
                        pictureBackGround: _pictureBackGround_y),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new CustomPaint(
                size: dashBoardSize,
                painter: new DashBoardIndicatorPainter_Z(widget.z, tableSpace_z,
                    _pictureBackGround_z, _pictureIndicator),
              ),
              new CustomPaint(
                size: dashBoardSize,
                painter: new DashBoardIndicatorPainter_DA(widget.da,
                    tableSpace_da, _pictureBackGround_da, _pictureIndicator),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//Widget dialCoordinates(){
//
//return Container(
//
//  new CustomPaint(
//    size: dashBoardSize,
//    painter: new DashBoardIndicatorPainter_Z(
//        pressures,
//        tableSpace_z,
//        _pictureBackGround_z,
//        _pictureIndicator),
//  ),
//
//)
//
//
//}
