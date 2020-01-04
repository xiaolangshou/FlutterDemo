import 'dart:convert';
//import 'package:d5_cylinder/Device/DeviceDetail/feedProcess/with_bar_renderer.dart';
import 'package:d5_cylinder/Device/DeviceDetail/feedProcess/process_number_average_part_bar.dart';
import 'package:d5_cylinder/Device/DeviceDetail/feedProcess/processed_number_parts_bar.dart';
import 'package:d5_cylinder/blocs/bloc_provider.dart';
import 'package:d5_cylinder/blocs/coord_detail_bloc.dart';
import 'package:d5_cylinder/models/coord_detail_model.dart';
import 'package:d5_cylinder/res/styles.dart';
import 'package:d5_cylinder/ui/widgets/Dial/DashDefine.dart';
import 'package:flutter/material.dart';

import 'feed_rate.dart';

class GalleryScaffold extends StatefulWidget {
  final String deviceNo;

  const GalleryScaffold({Key key, @required this.deviceNo}) : super(key: key);
  @override
  _GalleryScaffoldState createState() => new _GalleryScaffoldState();

}

class _GalleryScaffoldState extends State<GalleryScaffold> {
  List<CoordDetailModelEntity> _bankList = [];
  List<dynamic> data;
  Stream<String> stream;

//  void _handleButtonPress() {
//    setState(() {});
//  }

  @override
  void initState() {
    super.initState();
    stream = new Stream.fromFuture(getData());
    print("Created the stream");
  }

  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 0)); //Mock delay
    print("Fetched Data");
    return DefaultAssetBundle.of(context)
        .loadString("assets/data/smoothline.json");
  }

  @override
  Widget build(BuildContext context) {
    final CoordDetailBloc bloc = BlocProvider.of<CoordDetailBloc>(context);

    return new Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
        child: StreamBuilder(
            initialData: bloc.initData,
            stream: bloc.recvWebsocket,
            builder: (context, snapshot) {
              String text;
              CoordDetailModelFanuc model;

              if (snapshot.hasError) {
                text = "网络不通...";
              } else if (snapshot.hasData) {
                text = "echo: " + snapshot.data;
                final jsonData = json.decode(snapshot.data);
                CoordDetailModelEntity items =
                    CoordDetailModelEntity.fromJson(jsonData);

                print("widget.deviceNo = ${widget.deviceNo}");

                switch (widget.deviceNo) {
                  case "01":
                    {
                      model = items.cNC01;
                    }
                    break;
                  case "02":
                    {
                      model = items.cNC02;
                    }
                    break;
                  case "14":
                    {
                      model = items.cNC14;
                    }
                    break;
                  default:
                    {
                      model = items.cNC15;
                    }
                    break;
                }
              }
              return ListView(
                padding: const EdgeInsets.all(8.0),
                children: <Widget>[
                  Gaps.vGap10,
                  /*垂直间隔*/

                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.white,
                    ),
                    child: new SizedBox(
                      height: 250.0,
                      child: FeedrateView(
                        socketdata: model,
                      ),
                    ),
                  ),
                  Gaps.vGap10,
                  /*垂直间隔*/
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("加工零件数",
                            style:
                                TextStyle(color: Colors.black, fontSize: 23)),
                        new SizedBox(
                            height: 250.0,
                            child: TimeDaySeriesBar.getDaySocketData(model)),
                      ],
                    ),
                  ),

                  Gaps.vGap10,
                  /*垂直间隔*/
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("平均每小时",
                            style:
                                TextStyle(color: Colors.black, fontSize: 23)),
                        new SizedBox(
                            height: 250.0,
                      child: TimeHourSeriesBar.getHourSocketData(model)),
                      ],
                    ),
                  ),

                  Gaps.vGap10,

                ],
              );
            }),
      ),
//      floatingActionButton: new FloatingActionButton(
//          child: new Icon(Icons.refresh), onPressed: _handleButtonPress),
    );
  }
}


