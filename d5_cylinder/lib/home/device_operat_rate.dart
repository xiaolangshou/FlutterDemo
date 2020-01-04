import 'package:d5_cylinder/Device/DeviceDetail/spindleState/ring_progress.dart';
import 'package:d5_cylinder/blocs/home_detail_bloc.dart';
import 'package:d5_cylinder/common/component_index.dart';
import 'package:d5_cylinder/models/home_device_model_entity.dart';
import 'package:flutter/material.dart';


class DeviceOperationRate extends StatefulWidget {
  @override
  DeviceOperationRateState createState() => new DeviceOperationRateState();
}

class DeviceOperationRateState extends State<DeviceOperationRate> {
  @override

  Widget build(BuildContext context) {
    final HomeDetailBloc bloc = BlocProvider.of<HomeDetailBloc>(context);
    Size size = MediaQuery.of(context).size;
    var width = size.width - 16;
    HomeDeviceModelEntity model;
    return  StreamBuilder<Object>(
        initialData: bloc.initData,
        stream: bloc.recvWebsocket,
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            print("网路不通....");
          } else if (snapshot.hasData) {
            final jsonData = json.decode(snapshot.data);
            model = HomeDeviceModelEntity.fromJson(jsonData);
            print('bootstatus_0 ====${model.bootstatus0}');
          }

        return Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: Colors.white,
          ),
          child: new SizedBox(
            height: 200.0,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: <Widget>[

                new Container(
                  color: Colors.white,
                  child: Text(
                    "设备开机率",
                    style: TextStyle(fontSize: 16),
                  ),
                  alignment: FractionalOffset(0.05, 0.1),
                ),

                Container(color: Colors.grey[300],width: width,height: 0.5,),

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    buildDevice(4,model.bootstatus0,"正常",Size(width/5, 220),Colors.green),

                    buildDevice(4,model.bootstatus1,"调机/维修",Size(width/5, 220),Colors.yellow),

                    buildDevice(4,model.bootstatus2,"维修",Size(width/5, 220),Colors.red),

                    Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8),

                        child: RingProgress(
                            value: model.bootstatus0/4,
                            sizeValue: 100,
                            title: "开机率",
                            maxValue: 1.0,
                            dailColor:Colors.green
                        ),
                      ),
                    ],
                    ),
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
  void didUpdateWidget(DeviceOperationRate oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

Widget buildDevice(int total ,int num ,String title ,Size size,Color color ){

  final margin = 16.0;
  var squareHight = ((size.height - 2* margin)/2) * num/total;

  return Container(

    padding: EdgeInsets.all(margin),

//    color: Colors.blue,

    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: <Widget>[
        Text("${num}"),
        Container(width: size.width - margin*2 - 16 ,height: squareHight,color: color,),
        Text(title ,style: TextStyle(fontSize: 14),),
      ],),
  );
}
