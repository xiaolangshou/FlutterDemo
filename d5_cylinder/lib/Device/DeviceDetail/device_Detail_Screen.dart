import 'package:flutter/material.dart';
//import 'package:path/path.dart';
//import 'package:flutter/rendering.dart';

class DeviceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    debugPaintSizeEnabled = true;

    return buildView(context);
  }
}

Widget buildView(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true, //标题是否居中，默认为false
      title: Text("设备详情"),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.keyboard_return),
            onPressed: () => popCurrent(context))
      ],
    ),
    body: ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "hahahahah-----",
            ),
            Row(
              children: <Widget>[
                Image.network(
                  'https://picsum.photos/250?image=9',
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
                Image.network(
                  "https://picsum.photos/250?image=9",
                  width: 175,
                  height: 200,
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}

void popCurrent(BuildContext context) {
  Navigator.pop(context);
}
