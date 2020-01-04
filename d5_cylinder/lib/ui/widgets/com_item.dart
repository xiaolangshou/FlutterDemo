import 'package:flutter/material.dart';
import 'package:d5_cylinder/common/component_index.dart';

class HeadArrowItem extends StatelessWidget {
  const HeadArrowItem(this.model, {Key key}) : super(key: key);
  final ComModel model;

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 160,
        child: new Material(
          color: Colors.white,
          child: new ListTile(
              onTap: () {
//                if (model.page == null) {
//                  print("model.url");
//                  NavigatorUtil.pushWeb(context,
//                      title: model.title, url: model.url, isHome: true);
//                } else {
//                  NavigatorUtil.pushPage(context, model.page,
//                      pageName: model.title);
//                }
              },
              title: Container(
                height: 160.0,
                child: new Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
//                  Container(
//                    padding: EdgeInsets.only(
//                      left: 0,
//                    ),
//                    child:
                    new Image.asset(
                      Tools.getImgPath('avatar.png'),
                      width: 72.0,
                      fit: BoxFit.fill,
                      height: 72.0,
                    ),
//                  ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            'THomas',
                            style: new TextStyle(
                                color: Colours.gray_99, fontSize: 14.0),
                          ),
                          Gaps.vGap15,
                          new Text(
                            '12345' + AppConfig.version,
                            style: new TextStyle(
                                color: Colours.gray_99, fontSize: 14.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              trailing: Container(
                padding: EdgeInsets.only(top: 55),


                child: Icon(
                  Icons.navigate_next,
                  color: Colors.grey,
                ),
              )),
        ),
        decoration: new BoxDecoration(
            color: Colors.grey,
            border: new Border.all(width: 0.33, color: Colours.divider)));
  }
}

class ComArrowItem extends StatelessWidget {


  final Function callBack;
  final ComModel model;

  const ComArrowItem({this.model,this.callBack, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Material(
        color: Colors.white,
        child: new ListTile(
          onTap: () {


            if (model.page == null ) {
              print("model.url");
              callBack();
              if(model.url == null){

              }
              else {
                NavigatorUtil.pushWeb(context,
                    title: model.title, url: model.url, isHome: true);
              }
            } else {
              NavigatorUtil.pushPage(context, model.page,
                  pageName: model.title);
            }
        print("model.title===${model.title}  $model");

          },
          leading: Icon(model.icon),
          title: new Text(model.title == null ? "" : model.title),
          trailing: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                model.extra == null ? "" : model.extra,
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
              new Icon(
                Icons.navigate_next,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      decoration: Decorations.bottom,
    );
  }
}
