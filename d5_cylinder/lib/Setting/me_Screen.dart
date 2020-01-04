import 'dart:io';

import 'package:d5_cylinder/Setting/register_Screen.dart';
import 'package:d5_cylinder/Setting/setting_Screen.dart';
import 'package:d5_cylinder/Setting/tabbar_Screen.dart';
import 'package:d5_cylinder/models/models.dart';
import 'package:d5_cylinder/res/colors.dart';
import 'package:d5_cylinder/ui/widgets/com_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'about_Screen.dart';
import 'helps_screen.dart';

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choises = <Choice>[
  Choice(title: "自驾", icon: Icons.directions_car),
  Choice(title: "自行车", icon: Icons.directions_bike),
  Choice(title: "乘船", icon: Icons.directions_boat),
  Choice(title: "公交车", icon: Icons.directions_bus),
  Choice(title: "火车", icon: Icons.directions_railway),
  Choice(title: "步行", icon: Icons.directions_walk),
];

class MeControlerView extends StatefulWidget {
  @override
  _MeControlerViewState createState() => _MeControlerViewState();
}

class _MeControlerViewState extends State<MeControlerView> {

  String _cacheSizeStr;
  String version ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCache();

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        version = packageInfo.version;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
//    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);

    ComModel theme =
    new ComModel(title: '设置', icon: Icons.settings, page:  settingScreen());
    ComModel about =
    new ComModel(title: '关于', icon: Icons.list, page:  AboutScreenView());
    ComModel helps =
    new ComModel(title: '其他', icon: Icons.help, page: HelpsScreenVc());
    ComModel clear = new ComModel(
        title: '清除缓存', icon: Icons.restore_from_trash, page: null,extra: _cacheSizeStr);
    ComModel update = new ComModel(
        title: '检查更新', icon: Icons.file_upload, page: null,extra: version);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我的"),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new ComArrowItem(model: theme,),
          new ComArrowItem(model:about),
          new ComArrowItem(model:clear,callBack: (){
            print("清除缓存----");
            _clearCache();
          },),
          new ComArrowItem(model: update,callBack: (){

            print("最新版本----");

          },),
          new ComArrowItem(model: helps,),

        ],
      ),
    );
  }

//
// /*获取安装地址*/
//  Future<String> get _apkLocalPath async {
//    final directory = await getExternalStorageDirectory();
//    return directory.path;
//  }
//
///*下载*/
//  Future<void> executeDownload() async {
//    final path = _apkLocalPath;
//    //下载
//    final taskId = await FlutterDownloader.enqueue(
//        url: "http://192.168.1.232:5000/getLatestVerInfo/" + '/app-release.apk',
//        savedDir: path,
//        showNotification: true,
//        openFileFromNotification: true);
//    FlutterDownloader.registerCallback((id, status, progress) {
//      // 当下载完成时，调用安装
//      if (taskId == id && status == DownloadTaskStatus.complete) {
//        _installApk();
//      }
//    });
//  }
//
//
//// 安装
//  Future<Null> _installApk() async {
//    // XXXXX为项目名
//    const platform = "ios";
//    try {
//      final path = await _apkLocalPath;
//      // 调用app地址
////      await platform.invokeMethod('install', {'path': path + '/app-release.apk'});
//    } on PlatformException catch (_) {}
//  }


  Future<Null> loadCache() async {
    Directory tempDir = await getTemporaryDirectory();
    double value = await _getTotalSizeOfFilesInDir(tempDir);
    /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
    print('临时目录大小: ' + value.toString());
    setState(() {
      _cacheSizeStr = _renderSize(value);  // _cacheSizeStr用来存储大小的值
      print("_cacheSizeStr:$_cacheSizeStr");

    });
  }

  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      if (children != null)
        for (final FileSystemEntity child in children)
          total += await _getTotalSizeOfFilesInDir(child);
      return total;
    }
    return 0;
  }

  _renderSize(double value) {
    if (null == value) {
      return 0;
    }
    List<String> unitArr = List()
      ..add('B')
      ..add('K')
      ..add('M')
      ..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  void _clearCache() async {
    //此处展示加载loading
    try {
      Directory tempDir = await getTemporaryDirectory();
      //删除缓存目录
      await delDir(tempDir);
      await loadCache();
      Fluttertoast.showToast(msg: '清除缓存成功');
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: '清除缓存失败');
    } finally {
      //此处隐藏加载loading
    }
  }
  ///递归方式删除目录
  Future<Null> delDir(FileSystemEntity file) async {
    try {
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        for (final FileSystemEntity child in children) {
          await delDir(child);
        }
      }
      await file.delete();
    } catch (e) {
      print(e);
    }
  }

}

