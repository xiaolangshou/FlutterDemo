import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: Text('Thomas Lau'),
        ),
        body: new Center(
          child: CBoxDemo(),
        ),
      ),
    );
  }
}

class CBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 30.0,
              maxWidth: 100.0,
            ),
            child: Container(
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          )
        ],
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              SizedBox(
                width: 200.0,
                height: 300.0,
                child: Container(
                  alignment: Alignment(0.0, 0.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [
                      Color.fromRGBO(7, 102, 255, 1.0),
                      Color.fromRGBO(3, 54, 255, 1.0),
                    ]),
                  ),
                  child:
                      Icon(Icons.brightness_2, color: Colors.white, size: 32.0),
                ),
              ),
              Positioned(
                right: 20.0,
                top: 20.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
              ),
              Positioned(
                right: 20.0,
                top: 120.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
              ),
              Positioned(
                right: 70.0,
                top: 180.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
              ),
              Positioned(
                right: 60.0,
                top: 50.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
              ),
              Positioned(
                right: 90.0,
                top: 20.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
              ),
              Positioned(
                right: 4.0,
                top: 240.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
              ),
              Positioned(
                right: 30.0,
                top: 230.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
              ),
              Positioned(
                right: 40.0,
                top: 200.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
              ),
              Positioned(
                right: 55.0,
                top: 88.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconBadgeDemo extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadgeDemo(this.icon, {this.size = 64.0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Icon(icon, size: size, color: Colors.white),
        width: size + 60,
        height: size + 60,
        color: Colors.green);
  }
}
