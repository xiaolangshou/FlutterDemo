import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';


//final double Length = 67.0;


class StartView extends CustomPainter {
  BuildContext context;
  Paint mHelpPaint;
  Picture _pictureIndicator;
  Size dashBoardSize;

  StartView(this.context) {
    mHelpPaint = new Paint();
    mHelpPaint.style = PaintingStyle.stroke;
    mHelpPaint.color = Colors.blue[100];
    mHelpPaint.isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    var winSize = MediaQuery.of(context).size;
//  canvas.drawPath(gridPath(20, winSize ), mHelpPaint);
////   canvas.drawPath(drawCoo(canvas, Size(winSize.width/2, winSize.height/2 - 64), Size(winSize.width - 50, winSize.height-50)), mHelpPaint);
//    canvas.drawPath(drawCoo(canvas, Size(winSize.width/2, winSize.height/2), Size(winSize.width/2, winSize.height/2)), mHelpPaint);

//    Canvas canvas = Canvas(_recorder);
//    canvas.clipRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    dashBoardSize = new Size(200.0, 200.0);
//    int scale = 4;
//    double halfHeight = dashBoardSize.height / scale;
//    double halfWidth = dashBoardSize.width / scale;
//    double strokeWidth = 20;
//
//    Path path1 = new Path();
//    final double pi = 3.1415926;
//    num degToRad(num deg) => deg * (pi / 180.0);
//
//    path1.moveTo(-2.5, 20 / scale + halfHeight);
//    path1.lineTo(2.5, 20 / scale + halfHeight);
//    path1.lineTo(6.0, -30 / scale + halfHeight);
//    path1.lineTo(0.5, 8 / scale + strokeWidth);
//    path1.lineTo(-0.5, 8 / scale + strokeWidth);
//    path1.lineTo(-6.0, -30 / scale + halfHeight);
//
//    path1.close();
//    canvas.save();
//    canvas.translate(halfWidth, 0);
//    Paint paint1 = new Paint();
//    paint1.color = Colors.green;
//    paint1.style = PaintingStyle.fill;
//    canvas.drawPath(path1, paint1);
//    paint1.color = Colors.red;
//    canvas.drawCircle(
//        new Offset(0, dashBoardSize.height / scale), 6 / scale, paint1);
//    canvas.restore();
//
//
//
//
//
//
//
//    Offset offectcenter = Offset(halfWidth, halfHeight);
//    num radToDeg(num rad) => rad * (180.0 / pi);
//    final angle = 360.0 * 0.9;
//    final double radians = degToRad(angle);
//    final Rect arcRect = Rect.fromCircle(
//        center: offectcenter, radius: halfWidth - strokeWidth / 2);
//    final progressPaint = Paint()
//      ..style = PaintingStyle.stroke
//      ..color = Colors.indigoAccent
//      ..strokeWidth = strokeWidth;
//
//    double startAngle = (90 + 360*0.05) * pi /180 ;
//    canvas.drawArc(arcRect, startAngle, degToRad(angle), false, progressPaint);


//    Paint paint2 = new Paint();
//    paint2.style = PaintingStyle.stroke;
//    paint2.strokeWidth = 10;
//
//    Path path = new Path()..moveTo(halfWidth , halfHeight);
//    Rect rect = Rect.fromCircle(center: Offset(halfWidth, halfHeight ), radius: halfWidth - strokeWidth / 2);
//    path.arcTo(rect, 0.0, 3.14, true);
//    canvas.drawPath(path, paint2);

//    Path path = new Path();
//    var width = 200;
//    var height = 200;
//    path.moveTo(width / 2, height / 4);
//    path.cubicTo((width * 6) / 7, height / 9, (width * 13) / 13,
//        (height * 2) / 5, width / 2, (height * 7) / 12);
//    canvas.drawPath(path, paint2);
//
//    Path path2 = new Path();
//    path2.moveTo(width / 2, height / 4);
//    path2.cubicTo(width / 7, height / 9, width / 21, (height * 2) / 5,
//        width / 2, (height * 7) / 12);
//    canvas.drawPath(path2, paint2);



    Rect rect = Rect.fromCircle(
        center: Offset(30, 30), radius: 30);

    Paint _paint = new Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;
    RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(5));
//    canvas.drawRect(rect, _paint);/*绘制矩形文字显示蓝色背景*/
    canvas.drawRRect(rRect, _paint);/*绘制带圆角的矩形文字显示蓝色背景*/


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  /**
   * 绘制网格路径
   *
   * @param step    小正方形边长
   // ignore: slash_for_doc_comments, slash_for_doc_comments
   * @param winSize 屏幕尺寸
   // ignore: slash_for_doc_comments
   */

}

class DashBoardIndicatorPainter extends CustomPainter {
  final int speeds;
  double tableSpace;
  final Picture pictureBackGround;
  final Picture pictureIndicator;
//  final Picture pictureBackView;

  DashBoardIndicatorPainter(this.speeds, this.tableSpace,
      this.pictureBackGround, this.pictureIndicator);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPicture(pictureBackGround);
    drawIndicator(canvas, size);
    String text;
    if (speeds < 100) {
      text = (speeds * 2).toString() + "KM/H";
    } else {
      int s = speeds - 100;
      text = (100 * 2 + s * 3).toString() + "KM/H";
    }
    drawSpeendOnDashBoard(text, canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  ///画实时得速度值到面板上
  void drawSpeendOnDashBoard(String text, Canvas canvas, Size size) {
    double halfHeight = size.height / 2;
    double halfWidth = size.width / 2;
    canvas.save();
    canvas.translate(halfWidth, halfHeight);

    TextPainter textPainter = new TextPainter();
    textPainter.textDirection = TextDirection.ltr;
    textPainter.text = new TextSpan(
        text: text,
        style: new TextStyle(
            color: Colors.deepOrangeAccent,
            fontSize: 25.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
    textPainter.layout();
    double textStarPositionX = -textPainter.size.width / 2;
    double textStarPositionY = 73;
    textPainter.paint(canvas, new Offset(textStarPositionX, textStarPositionY));

    canvas.restore();
  }

  ///画速度指针
  void drawIndicator(Canvas canvas, Size size) {
    double halfHeight = size.height / 2;
    double halfWidth = size.width / 2;

    canvas.save();
    canvas.translate(halfWidth, halfHeight);
    canvas.rotate((-60 + speeds) * tableSpace);
    canvas.translate(-halfWidth, -halfHeight);

    canvas.drawPicture(pictureIndicator);

    canvas.restore();
  }
}

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Size dashBoardSize;
  int pressures = 0;
  static double pi = 3.14159265;
//  final double wholeCirclesRadian = pi * 2;
  final double wholeCirclesRadian = pi * 2;
double len = 200;
//  final double wholeCirclesRadian = 12.56;

  ///虽然一个圆被分割为160份，但是只显示120份
//  final int tableCount = 160;
  final int tableCount = 160;
  double tableSpace;
  Picture _pictureBackGround;
  Picture _pictureIndicator;

  @override
  void initState() {
    super.initState();
    dashBoardSize = new Size(len, len);
    tableSpace = wholeCirclesRadian / tableCount;
    _pictureBackGround =
        DashBoardTablePainter(tableSpace, dashBoardSize).getBackGround();

    _pictureIndicator = IndicatorPainter(dashBoardSize).drawIndicator();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, //标题是否居中，默认为false
        title: Text("注册"),
      ),
      body: CustomPaint(
        painter: StartView(context),

//        child: new CustomPaint(
//          size: dashBoardSize,
//          painter: new DashBoardIndicatorPainter(
//              pressures, tableSpace, _pictureBackGround, _pictureIndicator),
//        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "InCrement",
        child: Icon(Icons.add),
      ),
    );
  }
}

Path gridPath(int step, Size winSize) {
  Path path = new Path();

  for (int i = 0; i < winSize.height / step + 1; i++) {
    path.moveTo(0, step * i.toDouble());
    path.lineTo(winSize.width, step * i.toDouble());
  }

  for (int i = 0; i < winSize.width / step + 1; i++) {
    path.moveTo(step * i.toDouble(), 0);
    path.lineTo(step * i.toDouble(), winSize.height);
  }
  return path;
}

//绘制坐标系
drawCoo(Canvas canvas, Size coo, Size winSize) {
  //初始化网格画笔
  Paint paint = new Paint();
  paint.strokeWidth = 2;
  paint.style = PaintingStyle.stroke;

  //绘制直线
  canvas.drawPath(cooPath(coo, winSize), paint);
  //左箭头
  canvas.drawLine(new Offset(winSize.width, coo.height),
      new Offset(winSize.width - 10, coo.height - 6), paint);
  canvas.drawLine(new Offset(winSize.width, coo.height),
      new Offset(winSize.width - 10, coo.height + 6), paint);
  //下箭头
  canvas.drawLine(new Offset(coo.width, winSize.height - 90),
      new Offset(coo.width - 6, winSize.height - 10 - 90), paint);
  canvas.drawLine(new Offset(coo.width, winSize.height - 90),
      new Offset(coo.width + 6, winSize.height - 10 - 90), paint);
}

/**
 * 坐标系路径
 *
 * @param coo     坐标点
 * @param winSize 屏幕尺寸
 * @return 坐标系路径
 */
Path cooPath(Size coo, Size winSize) {
  Path path = new Path();
  //x正半轴线
  path.moveTo(coo.width, coo.height);
  path.lineTo(winSize.width, coo.height);
  //x负半轴线
  path.moveTo(coo.width, coo.height);
  path.lineTo(coo.width - winSize.width, coo.height);
  //y负半轴线
  path.moveTo(coo.width, coo.height);
  path.lineTo(coo.width, coo.height - winSize.height);
  //y负半轴线
  path.moveTo(coo.width, coo.height);
  path.lineTo(coo.width, winSize.height);
  return path;
}

Path myselfcooPath(Size coo, Size winSize) {
  double halfHeight = coo.width;
  double halfWidth = coo.height;
  Path path = new Path();
  path.moveTo(-2.5, 20);
  path.lineTo(2.5, 20);
  path.lineTo(6.0, -30);
  path.lineTo(0.5, -halfHeight + 8);
  path.lineTo(-0.5, -halfHeight + 8);
  path.lineTo(-6.0, -30);
  path.close();
  return path;
}

class IndicatorPainter {
  final Size size;
  IndicatorPainter(this.size);

  int scale = 2;
  final PictureRecorder _recorder = PictureRecorder();

  ///画速度指针
  Picture drawIndicator() {
    Canvas canvas = Canvas(_recorder);
    canvas.clipRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    double halfHeight = size.height / scale;
    double halfWidth = size.width / scale;
    Path path = new Path();

    path.moveTo(-2.5, 20 / scale);
    path.lineTo(2.5, 20 / scale);
    path.lineTo(6.0, -30 / scale);
    path.lineTo(0.5, -halfHeight + 8 / scale);
    path.lineTo(-0.5, -halfHeight + 8 / scale);
    path.lineTo(-6.0, -30 / scale);
    path.close();
    canvas.save();
    canvas.translate(halfWidth, halfHeight);
    Paint paint = new Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill;

    canvas.drawPath(path, paint);

    paint.color = Colors.black;
    canvas.drawCircle(new Offset(0.0, 0.0), 6, paint);

    canvas.restore();
    return _recorder.endRecording();
  }
}

class DashBoardTablePainter {
  final double tableSpace;
  double Length = 67.0;


//  var speedTexts = [
//    "0",
//    "20",
//    "40",
//    "60",
//    "80",
//    "100",
//    "120",
//    "140",
//    "160",
//    "180",
//    "200",
//    "230",
//    "260"
//  ];
  var speedTexts = ["", "", "", "", "", "", "", "", "", "", "", "", ""];
  final Size size;
  final PictureRecorder _recorder = PictureRecorder();

  DashBoardTablePainter(this.tableSpace, this.size);

  Picture getBackGround() {
    Canvas canvas = Canvas(_recorder);
    drawBackView(canvas, size);
    canvas.clipRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    drawTable(canvas, size);
    return _recorder.endRecording();
  }

/*绘制底部背景*/

  void drawBackView(Canvas canvas, Size size){

    int scale = 2;
    double arcLen = 0.8;
    double halfWidth = size.width / scale;
    double halfHeight = size.height / scale;
    Offset offectcenter = Offset(halfWidth, halfHeight);
    final double pi = 3.1415926;
    double strokeWidth = 15;
    num degToRad(num deg) => deg * (pi / 180.0);
    num radToDeg(num rad) => rad * (180.0 / pi);
    final angle = 360.0 * arcLen;
    final Rect arcRect = Rect.fromCircle(
        center: offectcenter, radius: halfWidth - strokeWidth / 2);
    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.indigoAccent
      ..strokeWidth = strokeWidth;
    canvas.drawArc(arcRect, degToRad(90 + 180*(1- arcLen)), degToRad(angle), false, progressPaint);
    canvas.save();
    canvas.restore();
  }

  ///画仪表盘的表格
  void drawTable(Canvas canvas, Size size) {
    int scale = 2;
    canvas.save();
    double halfWidth = size.width / scale;
    double halfHeight = size.height / scale;
    canvas.translate(halfWidth, halfHeight);

    Offset offectcenter = Offset(0, 0);

    Paint paintMain = new Paint();
    paintMain.color = Colors.blue;
//    paintMain.strokeWidth = 2.5;
    paintMain.strokeWidth = 1.5;

    paintMain.style = PaintingStyle.fill;

    Paint paintOther = new Paint();
    paintOther.color = Colors.blue;
    paintOther.strokeWidth = 1;
    paintOther.style = PaintingStyle.fill;

    drawLongLine(canvas, paintMain, halfHeight, speedTexts[6]);

    canvas.save();
    for (int i = 61; i <= 120; i++) {
      canvas.rotate(tableSpace);
      if (i % 10 == 0) {
        int a = (i / 10).ceil();
        changePaintColors(paintMain, i);
        drawLongLine(canvas, paintMain, halfHeight, speedTexts[a]);
      } else if (i % 5 == 0) {
        changePaintColors(paintMain, i);
        drawMiddleLine(canvas, paintMain, halfHeight);
      } else {
//        changePaintColors(paintOther, i);
//        drawSmallLine(canvas, paintOther, halfHeight);
      }
    }
    canvas.restore();

    canvas.save();
    for (int i = 59; i >= 0; i--) {
      canvas.rotate(-tableSpace);
      if (i % 10 == 0) {
        int a = (i / 10).ceil();
        changePaintColors(paintMain, i);
        drawLongLine(canvas, paintMain, halfHeight, speedTexts[a]);
      } else if (i % 5 == 0) {
        changePaintColors(paintMain, i);
        drawMiddleLine(canvas, paintMain, halfHeight);
      } else {
//        changePaintColors(paintOther, i);
//        drawSmallLine(canvas, paintOther, halfHeight);
      }
    }



    canvas.restore();

    canvas.restore();
  }

  void changePaintColors(Paint paint, int value) {
    if (value <= 20) {
      paint.color = Colors.green;
    } else if (value < 80) {
      paint.color = Colors.blue;
    } else {
      paint.color = Colors.red;
    }
  }

  ///画仪表盘上的长线
  void drawLongLine(
      Canvas canvas, Paint paintMain, double halfHeight, String text) {
    canvas.drawLine(new Offset(0.0, -halfHeight),
        new Offset(0.0, -halfHeight + Length / 20), paintMain);

    TextPainter textPainter = new TextPainter();
    textPainter.textDirection = TextDirection.ltr;
    textPainter.text = new TextSpan(
        text: text,
        style: new TextStyle(
          color: paintMain.color,
          fontSize: 12,
        ));
    textPainter.layout();
    double textStarPositionX = -textPainter.size.width / 2;
    double textStarPositionY = -halfHeight + 19;
    textPainter.paint(canvas, new Offset(textStarPositionX, textStarPositionY));
  }

  void drawMiddleLine(Canvas canvas, Paint paintMain, double halfHeight) {
    canvas.drawLine(new Offset(0.0, -halfHeight),
        new Offset(0.0, -halfHeight + Length / 30), paintMain);
  }

  ///画短线
  void drawSmallLine(Canvas canvas, Paint paintOther, double halfHeight) {
    canvas.drawLine(new Offset(0.0, -halfHeight),
        new Offset(0.0, -halfHeight + Length / 43), paintOther);
  }
}
