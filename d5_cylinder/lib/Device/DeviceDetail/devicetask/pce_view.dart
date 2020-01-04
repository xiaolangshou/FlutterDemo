import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildPCE(int value, Size size) {
  int gewei = (value % 10).toInt();
  int ten = ((value / 10) % 10).toInt();
  int hundreds = ((value / 100) % 10).toInt();
  int kilobit = ((value / 1000) % 10).toInt();
  int wan = (value / 10000).toInt();

  double width = ((size.width - 25) / 5.0);
  double height = size.height;

  var formList = [wan, kilobit, hundreds, ten, gewei];

  List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
  Widget content; //单独一个widget组件，用于返回需要生成的内容widget
//  for (var item in formList)

  for (var i = 0; i < formList.length; i++) {
    tiles.add(new Container(
      padding: EdgeInsets.only(left: 6, right: 6),
//      color: Colors.red,
      width: width,
      height: height,
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.only(top: 2, bottom: 2),
        width: width,
        child: new Image.asset(
          "assets/images/0${formList[i]}.png",
        ),
      ),
    ));

    if (i == formList.length - 1) {
      tiles.add(Container(
          width: 25,
//          color: Colors.red,

      alignment: Alignment.bottomCenter,
          child: Text(
            'Pcs',
            style: TextStyle(fontSize: 12,color: Colors.blueAccent),
          )));
    }
  }
  content = Container(
//   width: size.width,
//    height: size.height,
    color: Colors.white,
    child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
        //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
        ),
  );
  return content;
}
