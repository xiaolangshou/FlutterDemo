import 'DashDefine.dart';
import 'package:flutter/material.dart';

/*绘制刻度表盘的指针*/

class IndicatorPainter {
  final Size size;
  IndicatorPainter(this.size);
  int scale = 3;
  final PictureRecorder _recorder = PictureRecorder();

  ///画速度指针
  Picture drawIndicator() {
    Canvas canvas = Canvas(_recorder);
    canvas.clipRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    double halfHeight = size.height / 2;
    double halfWidth = size.width / 2;
    Path path = new Path();

    path.moveTo(-2.5 / scale, 20 / scale);
    path.lineTo(2.5 / scale, 20 / scale);
    path.lineTo(6.0 / scale, -30 / scale);
    path.lineTo(0.5 / scale, -halfHeight + strokeWidth + 8 / scale);
    path.lineTo(-0.5 / scale, -halfHeight + strokeWidth + 8 / scale);
    path.lineTo(-6.0 / scale, -30 / scale);
    path.close();
    canvas.save(); /*操作会保存此前的所有绘制内容和 Canvas 状态*/

    Paint paint = new Paint();
    paint.color = Colors.blue;
    paint.style = PaintingStyle.fill;
    canvas.translate(halfWidth, halfHeight);
    canvas.drawPath(path, paint);

    paint.color = Colors.black;
    canvas.drawCircle(new Offset(0.0, 0.0), 6 / scale, paint);

    canvas.restore(); /*合成*/
    return _recorder.endRecording();
  }
}