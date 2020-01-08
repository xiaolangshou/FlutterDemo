import 'package:flutter/material.dart';

class FatherDevice extends StatelessWidget {

  void coordinateBtnTapped() {
    print('coordinateBtnTapped ...');
    coordinateBtnTap();
  }

  void feedRateBtnTapped() {
    print('feedRateBtnTapped...');
    feedRateBtnTap();
  }

  void currentBtnTapped() {
    print('currentBtnTapped...');
    currentBtnTap();
  }

  VoidCallback coordinateBtnTap;
  VoidCallback feedRateBtnTap;
  VoidCallback currentBtnTap;

  final int _currentToolNo = 12;
  final String _usingTime = 'xxxxxxx';
  final String _runTime = '0009天 02:08:59';
  final String _cycleTime = '0000天 08:05:10';
  final String _cuttingTime = '0000天 01:28:43';
  final String _abnormalTime = '0000天 01:28:00';

  int currentToolNo() {
    return _currentToolNo;
  }

  String usingTime() {
    return _usingTime;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
            ),
            margin: EdgeInsets.all(8),
            height: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: width * 0.698,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: (width - 16) * 0.5,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                          ),
                          image: new DecorationImage(
                            image:
                            ExactAssetImage('assets/images/machine_bg.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('3D模型',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 21)),
                            Image(
                              image: AssetImage('assets/images/FOXNUM.gif'),
                              width: (width - 16) * 0.45,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: (width - 16) * 0.5,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('当前刀号',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 21)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('assets/images/cutter.png'),
                                  width: (width - 16) * 0.3,
                                ),
                                Stack(
                                  alignment: Alignment(0.5, 0.0),
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                          'assets/images/arror_right.png'),
                                      width: (width - 16) * 0.1,
                                    ),
                                    Text('$_currentToolNo',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ],
                            ),
                            Text('已使用:  $_usingTime',
                                style: TextStyle(
                                    color: Colors.lightBlue, fontSize: 17)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: width * 0.002,
                  color: Color.fromRGBO(240, 240, 240, 1.0),
                ),
                Container(
                  height: (width * 0.3),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: width * 0.3 * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('  设备运行', style: TextStyle(fontSize: 16),),
                            Text(_runTime + '  ', style: TextStyle(color: Colors.lightBlue, fontSize: 16)),
                          ],
                        ),
                      ),
                      Container(
                        height: width * 0.3 * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('  循环', style: TextStyle(fontSize: 16),),
                            Text(_cycleTime + '  ', style: TextStyle(color: Colors.lightBlue, fontSize: 16)),
                          ],
                        ),
                      ),
                      Container(
                        height: width * 0.3 * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('  伺服轴切削', style: TextStyle(fontSize: 16),),
                            Text(_cuttingTime + '  ', style: TextStyle(color: Colors.lightBlue, fontSize: 16)),
                          ],
                        ),
                      ),
                      Container(
                        height: width * 0.3 * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('  设备异常时间', style: TextStyle(fontSize: 16, color: Colors.redAccent)),
                            Text(_abnormalTime + '  ', style: TextStyle(color: Colors.redAccent, fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8, top: 0, right: 8, bottom: 8),
            height: (height -
                kToolbarHeight -
                50 -
                48 -
                16 -
                8 -
                35 -
                width -
                kBottomNavigationBarHeight) *
                0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  elevation: 0,
                  child: Container(
                    width: (width - 16 - 8) * 0.5,
                    margin:
                    EdgeInsets.only(left: 0, top: 0, right: 4, bottom: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      gradient: LinearGradient(colors: <Color>[
                        Color.fromRGBO(72, 214, 172, 1.0),
                        Color.fromRGBO(6, 178, 136, 1.0),
                      ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/images/cordinate_axis.png'),
                          width: 60,
                        ),
                        Text('坐标 / 移动量',
                            style:
                            TextStyle(color: Colors.white, fontSize: 19)),
                      ],
                    ),
                    alignment: Alignment.center,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onPressed: coordinateBtnTapped,
                ),
                RaisedButton(
                  elevation: 0,
                  child: Container(
                    width: (width - 16 - 8) * 0.5,
                    margin:
                    EdgeInsets.only(left: 4, top: 0, right: 0, bottom: 0),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      gradient: LinearGradient(colors: <Color>[
                        Color.fromRGBO(72, 214, 172, 1.0),
                        Color.fromRGBO(6, 178, 136, 1.0),
                      ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/images/feedrate.png'),
                          width: 60,
                        ),
                        Text('进给 / 加工数',
                            style:
                            TextStyle(color: Colors.white, fontSize: 19)),
                      ],
                    ),
                    alignment: Alignment.center,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onPressed: feedRateBtnTapped,
                ),
              ],
            ),
          ),
          RaisedButton(
            elevation: 0,
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                gradient: LinearGradient(colors: <Color>[
                  Color.fromRGBO(72, 214, 172, 1.0),
                  Color.fromRGBO(15, 178, 136, 1.0),
                ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/state.png'),
                    width: 60,
                  ),
                  Text('主轴状态 / 电流 / 温度',
                      style: TextStyle(color: Colors.white, fontSize: 19)),
                ],
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 8, top: 0, right: 8, bottom: 8),
              height: (height -
                  kToolbarHeight -
                  50 -
                  48 -
                  16 -
                  8 -
                  35 -
                  width -
                  kBottomNavigationBarHeight) *
                  0.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: currentBtnTapped,
          ),
        ],
      ),
    );
  }
}
