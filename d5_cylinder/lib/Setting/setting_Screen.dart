import 'package:d5_cylinder/res/theme.dart';
import 'package:d5_cylinder/store/index.dart';
import 'package:d5_cylinder/store/models/config_state_model.dart';
import 'package:flutter/material.dart';
import 'package:d5_cylinder/common/component_index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class settingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("设置"),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[

          new ExpansionTile(
            title: new Row(
              children: <Widget>[
                Icon(
                  Icons.color_lens,
                  color: Colours.gray_66,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
//                    IntlUtil.getString(context, Ids.titleTheme),
                      "主题"
                  ),
                )
              ],
            ),
            children: <Widget>[
              new Wrap(
                children: materialColor.keys.map((String key) {
                  ThemeModel themeModel = materialColor[key];
                  return new InkWell(
                    onTap: () {
                      // 修改并保存主题状态
                      Store.value<ConfigModel>(context).$setTheme(key);
                      print("value====${themeModel.primaryColor}  $key");
                      },
                    child: new Container(
                      margin: EdgeInsets.all(5.0),
                      width: 36.0,
                      height: 36.0,
                      color: Color(themeModel.primaryColor),
                    ),
                  );
                }
                ).toList(),
              )
            ],
          ),

        ],
      ),
    );
  }
}
