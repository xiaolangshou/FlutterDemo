import 'package:flutter/material.dart';

class DeviceStatsCell extends StatefulWidget {
  @override
  DeviceStatsCellState createState() => new DeviceStatsCellState();

  final String idStr;
  final String detail;
  final String timeStr;

  DeviceStatsCell({
  Key key,
  @required  this.idStr,
  @required  this.detail,
  @required this.timeStr
  }
    );
}

class DeviceStatsCellState extends State<DeviceStatsCell> {

  Color _currentColors = Colors.white;
  final margin = 8.0;


  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;
    final width = size.width;

    return GestureDetector(

      onTapDown: (TapDownDetails details){
        setState(() {
          _currentColors = Colors.grey[300];
        });

      },

      onTap: () {


        setState(() {
          _currentColors = Colors.white;
        });

      },

      onTapCancel: (){

        setState(() {
          _currentColors = Colors.white;
        });

      },

      child: Container(
        height: 60,
        color: _currentColors,
//        padding: EdgeInsets.only(left: 5,right: 5),
        child:


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: margin,),
            Container(
              width: 50,
//              color: Colors.red,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('编号:'),
                  Text('${widget.idStr}'),
                ],
              ),
            ),

            SizedBox(width: margin,),


            Container(

              width: width -50 -  margin * 5,
//              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.detail ,overflow: TextOverflow.ellipsis,maxLines: 2,textAlign: TextAlign.right,),
                  Text(widget.timeStr ),
                ],
              ),
            ),

            SizedBox(width: margin,),


          ],
        ),


//        new ListTile(
////       显示在title之前
//          leading: new Text("${widget.idStr}",style: TextStyle(backgroundColor: Colors.white,fontSize: 14.0,),textAlign: TextAlign.center,),
////        显示在title之后
////          trailing: new Text(widget.idStr),
//          title: new Text(widget.detail,style: TextStyle(backgroundColor: Colors.white,),),
//          subtitle:new Text(widget.timeStr,style: TextStyle(backgroundColor: Colors.white,fontSize: 14.0),),
//
//        ),

      ),
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
  void didUpdateWidget(DeviceStatsCell oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

class $ {
}