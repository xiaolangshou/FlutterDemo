import 'dart:io';

import 'package:d5_cylinder/blocs/webSocket_initData.dart';
import 'package:d5_cylinder/common/LogHelper.dart';
import 'package:d5_cylinder/common/common.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'bloc_provider.dart';
import 'dart:async';


class CoordDetailBloc extends BlocBase {
  IOWebSocketChannel channel;
  /*输出 websocket*/
  final _outwebsocket = StreamController<String>.broadcast();
  final String initData = websocketStr;
  Stream<String> get recvWebsocket => _outwebsocket.stream;

  CoordDetailBloc._() {
    channel = IOWebSocketChannel.connect("${websocketIP}:8765");
    channel.stream.listen(onData).onError(handleError);
  }

  Function handleError(error) {
    print("error=======>$error");
    if (error != null) {
//      Stream streamData = Stream.fromFuture(loadCountryData());
      print("initData=========>$initData");
    }
  }

  Function handleDone() {}

  static CoordDetailBloc _instance;

  factory CoordDetailBloc() {
    _instance ??= CoordDetailBloc._();
    return _instance;
  }

  void onData(data) {
    LogHelper().info(data);
    _outwebsocket.add(data);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    channel.sink.close();
    _instance = null;
  }

//  void closeConnect(){
//    chnanel.sink.close();
//    _instance = null;
//  }

  @override
  Future getData({String labelId, int page}) {
    // TODO: implement getData
    return null;
  }

  @override
  Future onLoadMore({String labelId}) {
    // TODO: implement onLoadMore
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    // TODO: implement onRefresh
    return null;
  }
}

//
//Future<String> loadCountryData({BuildContext context}) async {
//  try {
//    String data = await DefaultAssetBundle.of(context)
//        .loadString("assets/data/countries.json");
//    print("data------------>$data");
//
//    return data;
//  } catch (e) {
//    print(e);
//    return null; // imagine this exists
//  }
//}
