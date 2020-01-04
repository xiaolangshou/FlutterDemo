import 'dart:core' as prefix0;
import 'dart:core';

import 'package:d5_cylinder/common/Tools/tools.dart';
import 'package:flutter/material.dart';
import 'deviceNature.dart';

final double width = 160;


Widget bottomTabbar({TabController tabController,List tags}) {
return PreferredSize(
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      bottom: TabBar(
        controller: tabController,
//          indicator: new BoxDecoration(
//            color: Colors.deepOrange,
//          ),
        isScrollable: true,
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.black,
        labelColor: Colors.white,
        tabs: [
          tabSelectView(index:tabController.index ,title:tags[0].title,selectValue: 0 ),
          tabSelectView(index:tabController.index ,title:tags[1].title,selectValue: 1 ),
          tabSelectView(index:tabController.index ,title:tags[2].title,selectValue: 2 ),
          tabSelectView(index:tabController.index ,title:tags[3].title,selectValue: 3 ),
        ],
      ),
    ),
    preferredSize: Size.fromHeight(48));


}


BoxDecoration selectBackBoxDecorationColor({int index, int selectValue}) {
  return BoxDecoration(
    color: index == selectValue ? selectBackColor : Colors.grey,
    borderRadius: BorderRadius.all(
      Radius.circular(4.0),
    ),
  );
}


Widget tabSelectView({int index ,String title ,int selectValue})
{

  return
    Tab(
    child: Container(
      width: width,
      child: Container(
        height: 35,
        decoration: selectBackBoxDecorationColor(
            index: index, selectValue: selectValue),
        margin: EdgeInsets.only(
            top: 5, bottom: 5, left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.build,),
            Text(title),
          ],
        ),
      ),
    ),
  );

}