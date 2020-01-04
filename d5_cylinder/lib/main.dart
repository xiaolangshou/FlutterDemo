import 'package:d5_cylinder/res/theme.dart';
import 'package:d5_cylinder/store/index.dart';
import 'package:d5_cylinder/store/models/config_state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provide/provide.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottom_nav_widget.dart';
import 'common/LogHelper.dart';
import 'models/scoped_model.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;



void main() async {

//  debugPaintSizeEnabled = true; //打开视觉调试开关
//  await LogHelper().connectRemote();
//  LogHelper().info("你好");
/*🈲止横屏*/
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    return runApp(Store.init(child: MainApp()));
  });

}


class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {

    Store.value<ConfigModel>(context).$getTheme();
    // 获取Provide状态
    return Store.connect<ConfigModel>(builder: (context, child, model) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getThemeData(model.theme),
        initialRoute: '/',
        routes: {
          '/': (context) {
            return BottomNavWidget();
          },
        },
      );
    });
  }

}
