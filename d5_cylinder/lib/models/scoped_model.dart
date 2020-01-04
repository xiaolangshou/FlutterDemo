
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


final List<Color> themeList = [
  Colors.black,
  Colors.red,
  Colors.teal,
  Colors.pink,
  Colors.amber,
  Colors.orange,
  Colors.green,
  Colors.blue,
  Colors.lightBlue,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.cyan,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey
];
//
//ThemeData({
//Brightness brightness,
//MaterialColor primarySwatch,
//Color primaryColor,
//Brightness primaryColorBrightness,
//Color primaryColorLight,
//Color primaryColorDark,
//
//})


abstract class ThemeStateModel extends Model {

  int _themeIndex;
  get themeIndex => _themeIndex;

  void changeTheme(int themeIndex) async {
    _themeIndex = themeIndex;
    notifyListeners();
  }
}


abstract class mainStateModel extends Model {

  int _themeIndex;
  get themeIndex => _themeIndex;

  void changeTheme(int themeIndex) async {
    _themeIndex = themeIndex;
    notifyListeners();
  }
}



