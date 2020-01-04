import 'package:flutter/material.dart';
import 'package:d5_cylinder/common/component_index.dart';

class Choice {
  const Choice({
    this.title,
    this.icon,
    this.imageName,
  });
  final String title;
  final IconData icon;
  final String imageName;
}

List<Choice> buttonAry = <Choice>[
  Choice(title: "坐标/移动量", imageName: Tools.getImgPath("zuobiaofansuanlicheng.png")),
  Choice(title: "进给/加工数", imageName: Tools.getImgPath("fsux_tubiao_duijizhuzhuangtu.png")),
  Choice(title: "主流状态/电流/温度", imageName: Tools.getImgPath("jixieshebei.png")),
  Choice(title: "设备排配汇总", imageName: Tools.getImgPath("jiqishebei.png")),

];
