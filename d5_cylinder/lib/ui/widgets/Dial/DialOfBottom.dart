import 'package:flutter/material.dart';
import 'DashDefine.dart';

/*绘制通用的刻度盘的底部背景*/

class DialOfBottom {

  
  void drawBackView(Canvas canvas, Size size) {
    final Gradient gradient = new RadialGradient(colors: [
      Colors.grey[100].withOpacity(0.1),
      Colors.grey[200].withOpacity(0.3),
      Colors.grey[200].withOpacity(0.5),
      Colors.grey[300].withOpacity(0.7),
      Colors.grey[300].withOpacity(0.9)
    ], radius: 1, tileMode: TileMode.mirror);

    double arcLen = 0.76;
    double halfWidth = size.width / 2;
    double halfHeight = size.height / 2;
    Offset offectcenter = Offset(halfWidth, halfHeight);
    final double pi = 3.1415926;
    num degToRad(num deg) => deg * (pi / 180.0);
    num radToDeg(num rad) => rad * (180.0 / pi);
    final angle = 360.0 * arcLen;
    final Rect arcRect = Rect.fromCircle(
        center: offectcenter, radius: halfWidth - strokeWidth / 2);
    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.grey
      ..shader = gradient.createShader(arcRect)
      ..strokeWidth = strokeWidth;
    canvas.drawArc(arcRect, degToRad(90 + 180 * (1 - arcLen)), degToRad(angle),
        false, progressPaint);
    canvas.save();
    double arcLen1 = 1 - arcLen;
    final angle1 = 360.0 * (1 - arcLen);
    final progressPaint1 = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = strokeWidth;
    canvas.drawArc(arcRect, degToRad(180 * (0.5 - arcLen1)), degToRad(angle1),
        false, progressPaint1);

//    Path path = Path()..addRect(arcRect.translate(10, 0));
    Path path = Path()..addArc(arcRect, degToRad(180 * (0.5 - arcLen1)), degToRad(angle1));
    canvas.drawShadow(path, Colors.white, 2, true);/*绘制阴影*/
    canvas.restore();
  }


}
