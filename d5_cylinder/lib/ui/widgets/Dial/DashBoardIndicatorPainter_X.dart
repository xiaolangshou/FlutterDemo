import 'package:flutter/material.dart';
import 'DashDefine.dart';


/*根据传入数据动态绘制指针指示大小方向*/

class DashBoardIndicatorPainter_x extends CustomPainter {
  final double speeds;

  double tableSpace;
  final Picture pictureBackGround;
  final Picture pictureIndicator;
//  final Picture pictureBackView;
  double pointerValue = 0;

  DashBoardIndicatorPainter_x(this.speeds, this.tableSpace,
      this.pictureBackGround, this.pictureIndicator);

  @override
  void paint(Canvas canvas, Size size) {
    pointerValue =  conversionCoordXPosition(speeds);
    String text = speeds.toStringAsFixed(1);
    int all = 1400;
    double degree =  tableCount_x * 0.75;
    double value = all / degree ;/*传入最大是260分，X轴作出800等分*/
    canvas.drawPicture(pictureBackGround);
    drawIndicator(canvas, size);

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

    double textStarPositionX = 0;
    double textStarPositionY =
        halfHeight - size.width / 6 - size.width / 12; /*调整仪表数据显示位置*/
    double textWidth = halfWidth / 1.4;
    canvas.translate(halfWidth, halfHeight);
    canvas.save();

    TextPainter dialPainter = new TextPainter(
      text: new TextSpan(
        text: "X",
        style: new TextStyle(
            backgroundColor: Colors.white12,
            color: Colors.black54,
            fontSize: size.width / 8,
            /*调整显示仪表数据字体大小*/
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    dialPainter.layout();
    textStarPositionX = -dialPainter.size.width / 2;
    dialPainter.paint(canvas, new Offset(textStarPositionX, textStarPositionY/3));
    canvas.restore();
    canvas.save();

    Rect rect = Rect.fromLTWH(
        -textWidth / 2, textStarPositionY, textWidth, textWidth / 2.4);
    Paint _paint = new Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;
    RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(5));
//    canvas.drawRect(rect, _paint);/*绘制矩形文字显示蓝色背景*/
    canvas.drawRRect(rRect, _paint);/*绘制带圆角的矩形文字显示蓝色背景*/

    TextPainter textPainter = new TextPainter(
      text: new TextSpan(
        text: text,
        style: new TextStyle(
//            backgroundColor: Colors.blue,
            color: Colors.white,
            fontSize: size.width / 8,
            /*调整显示仪表数据字体大小*/
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout();
    textStarPositionX = -textPainter.size.width / 2;
    textPainter.paint(canvas, new Offset(textStarPositionX, textStarPositionY));
    canvas.restore();
  }

  ///画速度指针
  void drawIndicator(Canvas canvas, Size size) {
    double halfHeight = size.height / 2;
    double halfWidth = size.width / 2;

    canvas.save();
    canvas.translate(halfWidth, halfHeight);
//    canvas.rotate((-60 + speeds) * tableSpace);
    canvas.rotate((-(tableCount_x * 0.75)/2.0 + pointerValue) * tableSpace);

    canvas.translate(-halfWidth, -halfHeight);

    canvas.drawPicture(pictureIndicator);

    canvas.restore();
  }

  /*-700 对应0  0对应70  700 对应 140   */
  double conversionCoordXPosition(double value) {
    double x = 0.0;
    if (value == 0) {
      x = 70.0;
    } else if (value > 0) {
      x = (value / 10) + 70;
    } else {
      x = 70 - (value.abs() / 10);
    }
    return x;
  }


}



