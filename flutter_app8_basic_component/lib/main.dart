import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContainerDemo(),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
            // color: Color.fromRGBO(3, 54, 255, 1.0),
            padding: EdgeInsets.only(left: 24.0, right: 8.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                border: Border.all(
                  color: Colors.indigoAccent[100],
                  width: 3.0,
                  style: BorderStyle.solid,
                )),
          )
        ],
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  final Text _textDemo1 = Text(
      '李白 --- 《将进酒》。 君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。'
      '人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮'
      '三百杯。岑夫子，丹丘生，将进酒，杯莫停。与君歌一曲，请君为我倾耳听。钟鼓馔玉不足贵，但愿'
      '长醉不复醒。古来圣贤皆寂寞，惟有饮者留其名。陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，'
      '径须沽取对君酌。五花马，千金裘，呼儿将出换美酒，与尔同销万古愁',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16.0),
      maxLines: 3,
      overflow: TextOverflow.ellipsis);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('Thomas Lau'),
        ),
        body: _textDemo1);
  }
}

class RichTextDemo extends StatelessWidget {
  final RichText _textDemo2 = RichText(
      text: TextSpan(
    text: 'Thomas Lau',
    style: TextStyle(
      color: Colors.deepPurpleAccent,
      fontSize: 16.0,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    ),
    children: [
      TextSpan(
        text: '.net',
        style: TextStyle(fontSize: 17.0, color: Colors.grey),
      )
    ],
  ));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('Thomas Lau'),
        ),
        body: _textDemo2);
  }
}
