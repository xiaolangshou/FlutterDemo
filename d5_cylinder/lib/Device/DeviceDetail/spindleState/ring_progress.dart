import 'package:flutter/material.dart';
import 'gradientCircularProgressIndicator.dart';

class RingProgress extends StatelessWidget {

  double sizeValue = 200.0;
  String title;
  double maxValue;
  double value;

  Color dailColor;


  RingProgress({@required this.value,@required this.sizeValue,this.title,this.maxValue,this.dailColor});

  @override
  Widget build(BuildContext context) {

    List<Color> dialColor = [Colors.blue[100], Colors.blue[800]];
    Color textColor ;
    double valuefontSize = 8;
    double titlefontSize = 8;

    if (dailColor != null)
    {

      dialColor = [Colors.green[100], Colors.green[800]];
      textColor = Colors.grey;

    }
    else{
      if (value < 0.8) {
        dialColor = [Colors.blue[100], Colors.blue[800]];
        textColor = Colors.blue[800];
      } else{
        dialColor = [Colors.red[100], Colors.red[800]];
        textColor = Colors.red[800];
      }

    }



    if (maxValue > 1)
      {
        valuefontSize = 6;
        titlefontSize = 12;
      }
    else{
      valuefontSize = 4 ;
      titlefontSize = 7;
    }


    String maxValueStr;
    if (maxValue <= 1) {
      maxValueStr = "${(value * 100).toInt()}%";
    }
    else
    {
      double tempvalue = (value * maxValue);
      maxValueStr = tempvalue.toStringAsFixed(2);
    }
    print("打印:${value }");
    return Container(
      child:
      Column(
        children: <Widget>[
          SizedBox(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "$maxValueStr",
                        style: TextStyle(
                          fontSize: sizeValue/valuefontSize,
                          color: textColor,
                        ),
                      ),
                      Text(
                        "$title",
                        style: TextStyle(
                          fontSize: sizeValue/titlefontSize,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: GradientCircularProgressIndicator(
                    colors: dialColor,
                    radius: sizeValue/2.0,
                    stokeWidth: sizeValue/10.0,
                    value: value,
                    strokeCapRound: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
