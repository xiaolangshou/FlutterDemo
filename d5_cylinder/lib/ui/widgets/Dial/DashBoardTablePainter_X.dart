import 'package:flutter/material.dart';
import 'DashDefine.dart';


/*绘制X轴的刻度和大小标示*/


class DashBoardTablePainter_x {
  final double tableSpace;

  var speedTexts = [
    "-700",
    "",
    "",
    "-400",
    "",
    "",
    "",
    "0",
    "",
    "",
    "",
    "+400",
    "",
    "",
    "+700"
  ];
  final Size size;
  final PictureRecorder _recorder = PictureRecorder();

  DashBoardTablePainter_x(this.tableSpace, this.size);

  Picture getBackGround() {
    Canvas canvas = Canvas(_recorder);
    DialOfBottom().drawBackView(canvas, size);
    canvas.clipRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    drawTable(canvas, size);
    return _recorder.endRecording();
  }



  ///画仪表盘的表格
  void drawTable(Canvas canvas, Size size) {
    canvas.save();
    double halfWidth = size.width / 2;
    double halfHeight = size.height / 2;
    canvas.translate(halfWidth, halfHeight);

    Paint paintMain = new Paint();
    paintMain.color = Colors.black54;
    paintMain.strokeWidth = 2.5;
//    paintMain.strokeWidth = 1.5;

    paintMain.style = PaintingStyle.fill;

    Paint paintOther = new Paint();
    paintOther.color = Colors.black;
    paintOther.strokeWidth = 1;
    paintOther.style = PaintingStyle.fill;
    drawLongLine(canvas, paintMain, halfHeight, speedTexts[speedTexts.length~/2]);
    canvas.save();
    double degreeRatio = tableCount_x *0.75 ;
    int degreeValue = speedTexts.length - 1;/*整圆四分之三显示刻度，并做平分,*/
    int Value = (degreeRatio / degreeValue).floor();/*向下取整*/
    int offsetValue = degreeRatio.floor()  - Value * degreeValue ;



    for (int i = degreeRatio~/2 + 1; i <= degreeRatio  ; i++) {
      canvas.rotate(tableSpace);
      if (i % Value == 0) {
        int a = (i / Value).ceil() ;
        if (a >= speedTexts.length)
        {
          break;
        }

        if (i == degreeRatio){
          changePaintColors(paintMain, i);
          drawLongLine(canvas, paintMain, halfHeight, speedTexts[a]);
        }
        else
          {
            changePaintColors(paintOther, i);
            drawLongLine(canvas, paintOther, halfHeight, speedTexts[a]);
          }
      }
    }
    canvas.restore();
    canvas.save();

    for (int i = degreeRatio~/2  - 1 ; i >= 0; i--) {
      canvas.rotate(-tableSpace);
      if (i % Value == 0) {
        int a = (i / Value).ceil();
        if (i == 0){
          changePaintColors(paintMain, i);
          drawLongLine(canvas, paintMain, halfHeight, speedTexts[a]);
        }
        else
        {
          changePaintColors(paintOther, i);
          drawLongLine(canvas, paintOther, halfHeight, speedTexts[a]);
        }
      }

//      else if (i % 5 == 0) {
//        changePaintColors(paintMain, i);
//        drawMiddleLine(canvas, paintMain, halfHeight);
//      } else {
//        changePaintColors(paintOther, i);
//        drawSmallLine(canvas, paintOther, halfHeight);
//      }
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
  void drawSmallLine(Canvas canvas, Paint paintOther, double halfHeight) {
    canvas.drawLine(new Offset(0.0, -halfHeight),
        new Offset(0.0, -halfHeight + Length / 43), paintOther);
  }
}