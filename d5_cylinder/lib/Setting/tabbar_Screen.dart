import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

class TabbarPageView extends StatefulWidget {
  @override
  _TabbarViewState createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarPageView>
    with SingleTickerProviderStateMixin {
  @override
  TabController _tabController;
  List<Choice> _tags = <Choice>[
    Choice(title: "01", icon: Icons.settings_system_daydream),
    Choice(title: "02", icon: Icons.settings_input_component),
    Choice(title: "14", icon: Icons.settings_input_antenna),
    Choice(title: "15", icon: Icons.settings_input_antenna),

  ];

  Choice selectChoise =
      Choice(title: "01", icon: Icons.settings_system_daydream);

  List<Choice> _selected = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("状态栏"),

//        bottom: new TabBar(
//          tabs: _tags.map((Choice choise) {
//            return Container(
//              width: 150,
//              child: ChoiceChip(
//                selectedColor: Colors.black,
//                label: Text(choise.title),
//                selected: selectChoise == choise,
//                onSelected: (value) {
//                  setState(() {
//                    selectChoise = choise;
//                  });
//                },
//              ),
//            );
//          }).toList(),
//          isScrollable: true,
//          controller: _tabController,
//        ),

        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.grey,
          indicator: _tabController.index == 1
              ? new BoxDecoration(
                  color: Color.fromARGB(255, 0, 197, 147),
                )
              : new BoxDecoration(
                  color: Colors.red,
                ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
                text: 'Sale',
                icon: Icon(Icons.directions_car,
                    color: _tabController.index == 0
                        ? Colors.black
                        : Colors.grey)),
            Tab(
                text: 'Latest',
                icon: Icon(Icons.directions_transit,
                    color: _tabController.index == 1
                        ? Colors.black
                        : Colors.grey)),
            Tab(
                text: 'Popular',
                icon: Icon(Icons.directions_bike,
                    color: _tabController.index == 2
                        ? Colors.black
                        : Colors.grey)),
            Tab(
                text: 'Popular',
                icon: Icon(Icons.directions_bike,
                    color: _tabController.index == 3
                        ? Colors.black
                        : Colors.grey)),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Center(child: new Text('自行车')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                //将Transform.rotate换成RotatedBox
                child: RotatedBox(
                  quarterTurns: 1, //旋转90度(1/4圈)
                  child: Text("Hello world"),
                ),
              ),
              Text(
                "你好",
                style: TextStyle(color: Colors.green, fontSize: 18.0),
              )
            ],
          ),
          new Container(
            width: 200,
            height: 100,
            color: Colors.black,
            child: new Transform(
              alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
              transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
              child: new Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text('Apartment for rent!'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();

    super.dispose();
  }
}
