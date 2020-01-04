import 'package:d5_cylinder/blocs/bloc_provider.dart';
import 'package:d5_cylinder/blocs/home_detail_bloc.dart';
import 'package:d5_cylinder/common/component_index.dart';
import 'package:d5_cylinder/models/home_device_model_entity.dart';
import 'package:flutter/material.dart';

import 'device_stats_cell.dart';


class DeviceStatsView extends StatefulWidget {
  @override
  DeviceStatsViewState createState() => new DeviceStatsViewState();

}

class DeviceStatsViewState extends State<DeviceStatsView> {

  List formList;

  @override
  Widget build(BuildContext context) {
    final HomeDetailBloc bloc = BlocProvider.of<HomeDetailBloc>(context);
    Size size = MediaQuery.of(context).size;
    var width = size.width - 16;
    return StreamBuilder<Object>(
      initialData: bloc.initData,
      stream: bloc.recvWebsocket,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("网路不通....");
        } else if (snapshot.hasData) {
          final jsonData = json.decode(snapshot.data);
          HomeDeviceModelEntity model = HomeDeviceModelEntity.fromJson(jsonData);
          print('bootstatus_0 ====${model.bootstatus0}');
          formList = model.workstatus;

        }

        return Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: Colors.white,
          ),
          child: new SizedBox(
            height: 250.0,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: <Widget>[

                new Container(
                  color: Colors.white,
                  child: Text(
                    "设备生产状况记录显示及预测",
                    style: TextStyle(fontSize: 16),
                  ),
                  alignment: FractionalOffset(0.05, 0.1),
                ),

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(color: Colors.white,width: width,height: 220,child: ListView(
//                        padding: const EdgeInsets.all(8.0),
                        children: <Widget>[
                          buildGrid(),
                        ]),),
                  ],),

              ],
            ),
          ),
        );
      }
    );

  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(DeviceStatsView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Widget buildGrid() {
    List<Widget> tiles = [];//先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    for(var item in formList) {
      tiles.add(
          new Column(
              children: <Widget>[
                SizedBox(
                  height: 0.5,
                  child: Container(color: Colors.grey[300],),
                ),
                DeviceStatsCell(
                  idStr: '${item.id}',
                  detail: item.message,
                  timeStr: DateUtil.getDateStrByMs((int.parse(item.rundate)*1000),format: DateFormat.NORMAL),
                ),
              ]
          )
      );
    }
    content = new Column(
        children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
      //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
    );
    return content;
  }

}



