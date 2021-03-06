import 'package:flutter/material.dart';
import 'DashDefine.dart';


/*绘制Y轴的刻度和大小标示*/


class DashBoardTablePainter_Z {
  final double tableSpace;
  var speedTexts = [
    "",
    "",
    "-200",
    "",
    "",
    "",
    "",
    "",
    "",
    "+200",
    "",
    ""
  ];

  final Size size;
  final PictureRecorder _recorder = PictureRecorder();

  DashBoardTablePainter_Z(this.tableSpace, this.size);

  Picture getBackGround() {
    Canvas canvas = Canvas(_recorder);
    DialOfBottom().drawBackView(canvas, size);
    canvas.clipRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    drawTable(canvas, size);
    return _recorder.endRecording();
  }



  ///画仪表盘的表格,高度定制化，不具有通用作用。
  void drawTable(Canvas canvas, Size size) {
    canvas.save();
    double halfWidth = size.width / 2;
    double halfHeight = size.height / 2;
    canvas.translate(halfWidth, halfHeight);

    Paint paintMain = new Paint();
    paintMain.color = Colors.black54;
    paintMain.strokeWidth = 1.5;
    paintMain.style = PaintingStyle.fill;


    Paint paintOther = new Paint();
    paintOther.color = Colors.black54;
    paintOther.strokeWidth = 1;
    paintOther.style = PaintingStyle.fill;

    drawLongLine(canvas, paintMain, halfHeight, "0");

    canvas.save();
    double degreeRatio = tableCount_z *0.75 ;
    int degreeValue = speedTexts.length - 1;/*整圆四分之三显示刻度，并做平分,*/
    int Value = (degreeRatio / degreeValue).floor();/*向下取整*/
    int offsetValue = degreeRatio.floor()  - Value * degreeValue ;
    for (int i = degreeRatio~/2 + 1; i <= degreeRatio  ; i++) {
      canvas.rotate(tableSpace);

      if (i == degreeRatio){
        changePaintColors(paintMain, i);
        drawLongLine(canvas, paintMain, halfHeight, "330");
      }
      else  if ((i + 2) % 5 == 0) {
        print("i =====$i");
        int a = (i - 3)~/5 -1;
        changePaintColors(paintOther, i);
        drawSmallLine(canvas, paintOther, halfHeight, speedTexts[a]);
      }
      else {


      }

    }

    canvas.restore();
    canvas.save();


    for (int i = degreeRatio~/2  - offsetValue - 1 ; i >= 0; i--) {
      canvas.rotate(-tableSpace);
      if (i == 0){
        changePaintColors(paintMain, i);
        drawLongLine(canvas, paintMain, halfHeight, "-330");
      }
      else  if ((i + 2) % 5 == 0) {
        print("i =====$i");
        int a = (i - 3)~/5;
        changePaintColors(paintOther, i);
        drawSmallLine(canvas, paintOther, halfHeight, speedTexts[a]);
      }
      else {


      }
    }
    canvas.restore();
    canvas.restore();

  }

  void changePaintColors(Paint paint, int value) {
//    if (value <= 20) {
//      paint.color = Colors.green;
//    } else if (value < 80) {
//      paint.color = Colors.blue;
//    } else {
//      paint.color = Colors.red;
//    }
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
          fontSize: size.width / 16,
        ));
    textPainter.layout();
    double textStarPositionX = -textPainter.size.width / 2;
    double textStarPositionY = -halfHeight + halfHeight/10;
    textPainter.paint(canvas, new Offset(textStarPositionX, textStarPositionY));
  }

  void drawMiddleLine(Canvas canvas, Paint paintMain, double halfHeight) {
    canvas.drawLine(new Offset(0.0, -halfHeight),new Offset(0.0, -halfHeight + Length / 30), paintMain);
  }

  ///画短线
  void drawSmallLine(Canvas canvas, Paint paintOther, double halfHeight,String text) {
    canvas.drawLine(new Offset(0.0, -halfHeight),
        new Offset(0.0, -halfHeight + Length / 43), paintOther);

    TextPainter textPainter = new TextPainter();
    textPainter.textDirection = TextDirection.ltr;
    textPainter.text = new TextSpan(
        text: text,
        style: new TextStyle(
          color: paintOther.color,
          fontSize: size.width / 16,
        ));
    textPainter.layout();
    double textStarPositionX = -textPainter.size.width / 2;
    double textStarPositionY = -halfHeight + halfHeight/10;
    textPainter.paint(canvas, new Offset(textStarPositionX, textStarPositionY));

  }
}