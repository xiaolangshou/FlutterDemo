import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as  status;
import 'package:web_socket_channel/web_socket_channel.dart';

import 'common.dart';

class SingleManager {


  IOWebSocketChannel chnanel ;

  // 工厂模式
  factory SingleManager() =>_getInstance();
  static SingleManager get instance => _getInstance();
  static SingleManager _instance;
  SingleManager._internal() {
    // 初始化
    if (chnanel == null) {
      chnanel = IOWebSocketChannel.connect("${websocketIP}:8765");
    }

  }
  static SingleManager _getInstance() {
    if (_instance == null) {
      _instance = new SingleManager._internal();
    }
    return _instance;
  }

//  Future<Map<String, dynamic>> get(String path,
//      [Map<String, dynamic> params]) async {
//    Response<Map<String, dynamic>> response;
//
//    if (null != params) {
//      response = await channel.stream;
//    } else {
//      response = await channel.stream;
//    }
//    return response.data;
//  }


}