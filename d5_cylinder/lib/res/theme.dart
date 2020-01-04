import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeModel {
  final int primaryColor;
  final int primaryColorLight;

  ThemeModel(this.primaryColor, this.primaryColorLight);

  ThemeModel.fromJson(Map<String, dynamic> json)
      : primaryColor = json['primaryColor'], primaryColorLight = json['primaryColorLight'];

  Map<String, dynamic> toJson() =>
      {
        'primaryColor': primaryColor,
        'primaryColorLight': primaryColorLight,
      };
}

/*主题色*/
final  purple = ThemeModel(0xFF7B1FA2, 0xFF9C27B0);
final  pink = ThemeModel(0xFFc2185b, 0xFFd81b60);
final  deeppink = ThemeModel(0xFFf50057, 0xFFe91e63);
final  blue = ThemeModel(0xFF1976D2, 0xFF2196F3);
final  red = ThemeModel(0xFFFF0000, 0xFFFF0000);
final  chartreuse = ThemeModel(0xFF7febd7, 0xFF7febd7);/*黄绿色*/
final  aquamarine = ThemeModel(0xFF7fffd4, 0xFF7fffd4);/*碧绿色*/
final  azure = ThemeModel(0xFF0fffff, 0xFFF0fffff);/*天蓝色*/
final  coral = ThemeModel(0xFFff7f50, 0xFFff7f50);/*珊瑚色*/
final  darkgreen = ThemeModel(0xFF006400, 0xFF006400);/*暗绿色*/

Map <String, ThemeModel> materialColor = {
  'purple':purple,
  'pink':pink,
  'deeppink':deeppink,
  'blue':blue,
  'red':red,
  'chartreuse':chartreuse,
  'aquamarine':aquamarine,
  'azure':azure,
  'coral':coral,
  'darkgreen':darkgreen,

};


  class AppColor{

    static ThemeModel getAppThemeColorData(String theme){
      return  materialColor[theme];
    }

  }


 class AppTheme {

   static getThemeData(String theme)
   {
     ThemeModel mainColor = materialColor[theme];
    ThemeData themData = ThemeData(
//       scaffoldBackgroundColor: Colors.red, // 页面的背景颜色
      primaryColor: Color(mainColor.primaryColor), // 主颜色
      primaryColorLight: Color(mainColor.primaryColorLight),
      // 按钮颜色
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: Color(mainColor.primaryColor),
      ),

      // appbar样式
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),

      // 图标样式
      iconTheme: IconThemeData(
        color: Color(mainColor.primaryColor),
      ),
    );
    return themData;
  }
}
