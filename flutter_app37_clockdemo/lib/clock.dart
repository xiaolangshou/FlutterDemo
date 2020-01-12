import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  final String axisname;
  final double radius;
  final double currentValue;
  final double maxValue;
  final double minValue;
  final Color secondHandColor;
  final Color numberColor;
  final Color borderColor;

  const ClockPage(
      {Key key,
      this.axisname,
      this.secondHandColor,
      this.numberColor,
      this.borderColor,
      this.radius = 100.0,
      this.currentValue,
      this.maxValue,
      this.minValue})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ClockPageState();
  }
}

class ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            child: CustomPaint(
          painter: ClockPainter(widget.currentValue,
              widget.minValue,
              widget.maxValue,
              numberColor: Colors.grey,
              handColor: Colors.blue,
              borderColor: Color.fromRGBO(244, 244, 244, 1),
              radius: widget.radius),
          size: Size(widget.radius * 2, widget.radius * 2),
        )),
        Positioned(
            bottom: widget.radius * 2.6,
            left: widget.radius * 0.80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(widget.axisname.toString(),
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w300)),
                Text(widget.currentValue.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.blue,
                        fontWeight: FontWeight.w500))
              ],
            )),
      ],
    );
  }
}

class ClockPainter extends CustomPainter {
  final Color handColor;
  final Color numberColor;
  final Color borderColor;
  final double radius;
  List<Offset> secondsOffset = [];
  List<Offset> secondsOffset2 = [];
  final double _currentValue;
  final double _minValue;
  final double _maxValue;
  TextPainter textPainter;
  double angle;
  double borderWidth;

  ClockPainter(this._maxValue,
      this._minValue,
      this._currentValue,
      {this.radius = 100.0,
      this.handColor = Colors.black,
      this.numberColor = Colors.black,
      this.borderColor = Colors.black}) {
    borderWidth = radius / 4;
    final secondDistance = radius;
    final secondDistance2 = radius - (borderWidth * 0.5);

    //init seconds offset
    for (var i = 0; i < 12; i++) {
      Offset offset = Offset(
          cos(degToRad(30 * i - 90)) * secondDistance + radius,
          sin(degToRad(30 * i - 90)) * secondDistance + radius);
      secondsOffset.add(offset);

      Offset offset2 = Offset(
          cos(degToRad(30 * i - 90)) * secondDistance2 + radius,
          sin(degToRad(30 * i - 90)) * secondDistance2 + radius);
      secondsOffset2.add(offset2);
    }

    textPainter = new TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    angle = degToRad(360 / 60);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final scale = radius / 150;

    //draw border
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawCircle(
        Offset(radius, radius), radius - borderWidth / 2, borderPaint);

    //draw second point
    final secondPPaint = Paint()
      ..strokeWidth = 2 * scale
      ..color = numberColor;

    if (secondsOffset.length > 0) {
      for (var i = 0; i < secondsOffset.length; i++) {
        if (i != 6 && i!= 2 && i!= 5 && i!= 7 && i!= 10) {
          canvas.drawLine(secondsOffset[i], secondsOffset2[i], secondPPaint);
        } else {
//          canvas.drawImage(, secondsOffset[i], secondPPaint);
          canvas.drawLine(secondsOffset[i], secondsOffset2[i], secondPPaint);
        }
      }

      canvas.save();
      canvas.translate(radius, radius);

      List<Offset> bigger = [];
      for (var i = 0; i < secondsOffset.length; i++) {
        canvas.rotate(angle);
      }
      canvas.restore();

      final biggerPaint = Paint()
        ..strokeWidth = 5 * scale
        ..color = numberColor;
      canvas.drawPoints(PointMode.points, bigger, biggerPaint);
    }

    final second = _currentValue;

    // draw second hand
    Offset secondHand1 = Offset(
        radius - cos(degToRad(360 / 60 * second - 90)) * (radius * 0.01),
        radius - sin(degToRad(360 / 60 * second - 90)) * (radius * 0.01));

    Offset secondHand3 = Offset(
        radius - cos(degToRad(360 / 1 * second - 90)) * (radius * 0.02),
        radius - sin(degToRad(360 / 1 * second - 90)) * (radius * 0.02));

    Offset secondHand4 = Offset(
        radius + cos(degToRad(360 / 1 * second - 90)) * (radius * 0.02),
        radius + sin(degToRad(360 / 1 * second - 90)) * (radius * 0.02));

    Offset secondHand2 = Offset(
        radius +
            cos(degToRad(360 / 60 * second - 90)) * (radius - borderWidth - 15),
        radius +
            sin(degToRad(360 / 60 * second - 90)) *
                (radius - borderWidth - 15));
    final secondPaint = Paint()
      ..color = handColor
      ..strokeWidth = 2 * scale;
    canvas.drawLine(secondHand1, secondHand2, secondPaint);
    canvas.drawLine(secondHand3, secondHand2, secondPaint);
    canvas.drawLine(secondHand4, secondHand2, secondPaint);

    final centerPaint = Paint()
      ..strokeWidth = 2 * scale
      ..style = PaintingStyle.fill
      ..color = Colors.blue;
    canvas.drawCircle(Offset(radius, radius), 4 * scale, centerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

num degToRad(num deg) => deg * (pi / 180.0);

num radToDeg(num rad) => rad * (180.0 / pi);
