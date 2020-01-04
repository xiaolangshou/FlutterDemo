import 'dart:io';

import 'package:flutter/material.dart';
import 'package:d5_cylinder/common/component_index.dart';
import 'package:path_provider/path_provider.dart';



class Tools {
  static String getImgPath(String name) {
    print('assets/images/$name');
    return 'assets/images/$name';
  }


  static String getpngImgPath(String name, {String format:'png'}) {
    print('assets/images/$name.$format');
    return 'assets/images/$name.$format';
  }

  static Color nameToColor(String name) {
    // assert(name.length > 1);
    final int hash = name.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }


  static int getUpdateStatus(String version) {
    String locVersion = AppConfig.version;
    int remote = int.tryParse(version.replaceAll('.', ''));
    int loc = int.tryParse(locVersion.replaceAll('.', ''));
    if (remote <= loc) {
      return 0;
    } else {
      return (remote - loc >= 2) ? -1 : 1;
    }
  }

}
