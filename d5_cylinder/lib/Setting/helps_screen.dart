import 'package:d5_cylinder/res/colors.dart';
import 'package:d5_cylinder/ui/widgets/Dial/DashDefine.dart';
import 'package:flutter/material.dart';

class HelpsModel {
  final String title;
  final String content;

  HelpsModel(this.title, this.content);

  HelpsModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
      };
}

/*主题色*/
final one = HelpsModel("Fii是一家什么样的公司？",
    "Fii是全球领先的通信网络设备、云服务设备、精密工具及工业机器人专业设计制造服务商，为客户提供以工业互联网平台为核心的新形态电子设备产品智能制造服务。致力于为企业提供以自动化、网络化、平台化、大数据为基础的科技服务综合解决方案，引领传统制造向智能制造的转型;并以此为基础构建云计算、移动终端、物联网、大数据、人工智能、高速网络和机器人为技术平台的“先进制造+工业互联网”新生态。");
final two = HelpsModel("Fii主要从事什么工作？",
    "公司主要从事各类电子设备产品的设计、研发、制造与销售业务，依托于工业互联网为全球知名客户提供智能制造和科技服务解决方案。公司主要产品涵盖通信网络设备、云服务设备、精密工具和工业机器人。相关产品主要应用于智能手机、宽带和无线网络、多媒体服务运营商的基础建设、电信运营商的基础建设、互联网增值服务商所需终端产品、企业网络及数据中心的基础建设以及精密核心零组件的自动化智能制造等。");
final three = HelpsModel(
    "Fii的产品与服务是什么？", "公司主要提供5大方向的解决方案服务：工业互联网、工业机器人、精密工具、通讯网络设备、云服务设备。");
final four = HelpsModel("公司的经营理念是什么？",
    "本公司以创意、创新、创业为使命，凭借在智能制造的经验累积，将持续深耕物联网、大数据分析、演算法、人工智能、数据中心等技术及服务，为客户提供全方位的工业互联网服务。");

List<HelpsModel> helpList = [
  one,
  two,
  three,
  four,
];

class HelpsScreenVc extends StatefulWidget {
  @override
  _HelpsScreenVcState createState() => _HelpsScreenVcState();
}

class _HelpsScreenVcState extends State<HelpsScreenVc> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('常见问题'),
        ),
        body: Container(
//          color: backColor,
          color: Colors.grey[100],

          child: ListView.builder(
              itemCount: helpList.length,
              itemBuilder: (context, index) {
//              decoration: new BoxDecoration(
//                color: Colors.black26,
//              ),

                HelpsModel tempModel = helpList[index];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        color: Colors.white),
                      child: new ExpansionTile(
//                        backgroundColor: Colors.white,
                        title: Container(
                          child: new Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 0.0, right: 0),
                                child: Text(tempModel.title),
                              )
                            ],
                          ),
                        ),
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                            child: Text(
                              tempModel.content,
                              style: TextStyle(backgroundColor: Colors.white),
                            ),
                          )
                        ],
                      ),
                  ),
                );
              }),
        ));
  }
}
