import 'package:d5_cylinder/res/theme.dart';
import 'package:d5_cylinder/store/models/localStorage.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

class ConfigInfo {
//  String version = '1.0';
  String theme = 'darkgreen';
//  String appVersion = '-';
}

class ConfigModel extends ConfigInfo with ChangeNotifier {
  Future $getAppVersion() async {
    notifyListeners();
  }

  Future $getTheme() async {
    String _theme = await LocalStorage.get('theme');
//    print('config get Theme ${_theme}');
    if (_theme != null) {
      $setTheme(_theme);
    }
  }

  Future $setTheme(payload) async {
    theme = payload;
    LocalStorage.set('theme', payload);
    notifyListeners();
  }

}
