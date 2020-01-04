import 'package:flutter/material.dart';
import 'package:d5_cylinder/models/deviceInfomodel.dart';
import 'package:d5_cylinder/common/component_index.dart';
import 'deviceNature.dart';
import 'package:d5_cylinder/Device/DeviceDetail/coord/coord_Detail_Screen.dart';

Widget DeviceButtonView({BuildContext context, double height,Function collBlack}) {
  if (height < 106) {
    height = 106;
  }
  return Container(
      height: height,
      color: bgColor,
      child: Column(
        children: <Widget>[
          Gaps.vGap10,
          /*垂直间隔*/
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
//              Gaps.hGap5,
              /*水平间隔*/
              Expanded(
                child: heightButtonFrame(
                    choise: buttonAry[0],
                    height: height,
                    collBlack: (title) {
                      print("我是回调:$title");



                      collBlack(0);

                    }),
              ),
              Gaps.hGap10,
              /*水平间隔*/
              Expanded(
                child: heightButtonFrame(
                    choise: buttonAry[1],
                    height: height,
                    collBlack: (title) {
                      print("我是回调:$title");
                      collBlack(1);

                    }),
              ),
//              Gaps.hGap5, /*水平间隔*/
            ],
          ),
          Gaps.vGap10,
          /*垂直间隔*/
          Row(
            children: <Widget>[
//              Gaps.hGap5,
              Expanded(
                child: heightButtonFrame(
                    choise: buttonAry[2],
                    height: height,
                    collBlack: (title) {
                      print("我是回调:$title");
                      collBlack(2);

                    }),
              ),
              Gaps.hGap5,

              Expanded(
                child: heightButtonFrame(
                    choise: buttonAry[3],
                    height: height,
                    collBlack: (title) {
                      print("我是回调:$title");
                      collBlack(3);

                    }),
              ),

            ],
          ),
//          Gaps.vGap5, /*垂直间隔*/
        ],
      ));
}

Widget heightButtonFrame({Choice choise, double height, Function collBlack}) {
  height = (height - 20) / 2.0;
//  print("height = $height");
  return Container(
    height: height,
    child: FlatButton(
      color: Colors.green,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
//            heightFactor: 0.2,
//            widthFactor: 1,
            width: 43,
            height: 32,
            child: Image.asset(
              choise.imageName,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              choise.title,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
      onPressed: () {
        print("按钮点击事件----${choise.title}");
        collBlack(choise.title);
      },
    ),
  );
}
