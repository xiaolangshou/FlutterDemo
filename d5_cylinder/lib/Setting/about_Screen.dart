import 'package:d5_cylinder/Setting/author_page.dart';
import 'package:d5_cylinder/Setting/other_page.dart';
import 'package:d5_cylinder/blocs/bloc_provider.dart';
import 'package:d5_cylinder/blocs/main_bloc.dart';
import 'package:d5_cylinder/common/Tools/navigator_util.dart';
import 'package:d5_cylinder/common/Tools/tools.dart';
import 'package:d5_cylinder/common/common.dart';
import 'package:d5_cylinder/models/models.dart';
import 'package:d5_cylinder/models/setting_About_model.dart';
import 'package:d5_cylinder/res/colors.dart';
import 'package:d5_cylinder/res/strings.dart';
import 'package:d5_cylinder/res/styles.dart';
import 'package:d5_cylinder/ui/widgets/com_item.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';


//final initStr = {"title":"有新版本v0.1.2，去更新吧！","content":"","url":"https://raw.githubusercontent.com/Sky24n/LDocuments/master/AppStore/flutter_wana.apk"};

final me_help_question2_text = "公司主要从事各类电子设备产品的设计、研发、制造与销售业务，依托于工业互联网为全球知名客户提供智能制造和科技服务解决方案。公司主要产品涵盖通信网络设备、云服务设备、精密工具和工业机器人。相关产品主要应用于智能手机、宽带和无线网络、多媒体服务运营商的基础建设、电信运营商的基础建设、互联网增值服务商所需终端产品、企业网络及数据中心的基础建设以及精密核心零组件的自动化智能制造等。";



class AboutScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    ComModel github = new ComModel(
        title: 'GitHub',
        url: 'https://github.com/Sky24n/flutter_wanandroid',
        extra: 'Go Star');
    ComModel author = new ComModel(title: '作者', page: AuthorPage());
    ComModel other = new ComModel(title: '其他', page: OtherPage());

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("关于"),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 160.0,
              alignment: Alignment.center,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                    child: new Image.asset(
                      Tools.getImgPath('avatar.png'),
                      width: 72.0,
                      fit: BoxFit.fill,
                      height: 72.0,
                    ),
                  ),
                  Gaps.vGap5,
                  new Text(
                    '版本号 ' + AppConfig.version,
                    style: new TextStyle(color: Colours.gray_99, fontSize: 14.0),
                  )
                ],
              ),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  border: new Border.all(width: 0.33, color: Colours.divider))),
//          new ComArrowItem(github),
//          new ComArrowItem(author),
//          new ComArrowItem(other),

          Gaps.vGap10,
          Gaps.vGap10,

          Container(
            height: 50,
            padding: EdgeInsets.only(left: 30,right: 30),
            child: new OutlineButton(
              disabledBorderColor:Colors.red,
                child: new Text("兼善天下企业，赋能全球制造",style: TextStyle(color: Colors.red,fontSize: 20),),
                onPressed: null,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0),)
            ),
          ),
          
          Container(padding: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 0), child: Text(me_help_question2_text,style: TextStyle(color: Colors.grey),),),

          Container(padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10), child: Text("微信公众号",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.center,),),
          Padding(
            padding: const EdgeInsets.only(left: 80,right: 80),
            child: Divider(height:10,indent:0.0,color: Colors.black,),
          ),
          Container(padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 0), child: Text("工业富联601138",style: TextStyle(color: Colors.grey,),textAlign: TextAlign.center,),),

          Gaps.vGap10,
          Gaps.vGap10,

          Container(padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10), child: Text("商务合作",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.center,),),
          Padding(
            padding: const EdgeInsets.only(left: 80,right: 80),
            child: Divider(height:10.0,indent:0.0,color: Colors.black,),
          ),


          Container(padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 0), child: Text("官方电话:0755-33855777",style: TextStyle(color: Colors.grey,),textAlign: TextAlign.center,),),
          Container(padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 0), child: Text("官方传真:0755-33855778",style: TextStyle(color: Colors.grey,),textAlign: TextAlign.center,),),

          Gaps.vGap10,
          Gaps.vGap10,
          Gaps.vGap10,
          Gaps.vGap10,
          Gaps.vGap10,

          Container(padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 0), child: Text("富士康工业互联网股份有限公司",style: TextStyle(color: Colors.grey,fontSize: 18),textAlign: TextAlign.center,),),
          Container(padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 0), child: Text("Copyright © 2017 Foxconn Industrial Internet Co., Ltd.All rights reserved.",style: TextStyle(color: Colors.grey,fontSize: 15),textAlign: TextAlign.center,),),

          Gaps.vGap10,
          Gaps.vGap10,
          Gaps.vGap10,

        ],
      ),
    );
  }
}

