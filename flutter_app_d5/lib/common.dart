import 'dart:ui';
import 'package:flutter/material.dart';

final size = window.physicalSize;
final width = size.width;
final height = size.height;

Widget myTab(String title, int index, int selectedIndex) {
  bool isSelected = (index == selectedIndex ? true : false);

  return Container(
    color: Colors.transparent,
    height: 50,
    width: 160,
    child: Container(
      height: 35,
      decoration: backColorBD(isSelected),
      margin: EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          isSelected
              ? Image(
            image: AssetImage('assets/images/robot_arm_highlight.jpg'),
            width: 40,
          )
              : Image(
            image: AssetImage('assets/images/robot_arm.jpg'),
            width: 40,
          ),
          Text(title,
              style:
              TextStyle(color: isSelected ? Colors.white : Colors.black)),
        ],
      ),
    ),
  );
}

BoxDecoration backColorBD(bool isSelected) {
  return BoxDecoration(
      borderRadius: BorderRadius.all((Radius.circular(4.0))),
      color: isSelected ? Colors.greenAccent : Color.fromRGBO(209, 209, 209, 1),
      gradient: isSelected
          ? LinearGradient(
        colors: [
          Color.fromRGBO(63, 214, 170, 1),
          Color.fromRGBO(0, 172, 122, 1)
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      )
          : null);
}