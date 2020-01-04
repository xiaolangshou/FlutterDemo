import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class MessageUtils {
//  static WebSocketChannel _webSocket;
//  static num _id = 0;
//
//  static void connect() {
//    Future<WebSocketChannel> futureWebSocket =
//
//    WebSocketChannel.
//
//    WebSocket.connect(Api.WS_URL + "/leyan");// Api.WS_URL 为服务器端的 websocket 服务
//    futureWebSocket.then((WebSocket ws) {
//      _webSocket = ws;
//      _webSocket.readyState;
//      // 监听事件
//      void onData(dynamic content) {
//        _id++;
//        _sendMessage("收到");
//        _createNotification("新消息", content + _id.toString());
//      }
//
//      _webSocket.listen(onData,
//          onError: (a) => print("error"), onDone: () => print("done"));
//    });
//  }
//
//  static void closeSocket() {
//    _webSocket.close();
//  }
//
//  // 向服务器发送消息
//  static void _sendMessage(String message) {
//    _webSocket.add(message);
//  }
//
//  // 手机状态栏弹出推送的消息
//  static void _createNotification(String title, String content) async {
//    await LocalNotifications.createNotification(
//      id: _id,
//      title: title,
//      content: content,
//      onNotificationClick: NotificationAction(
//          actionText: "some action",
//          callback: _onNotificationClick,
//          payload: "接收成功！"),
//    );
//  }
//
//  static _onNotificationClick(String payload) {
//    LocalNotifications.removeNotification(_id);
//    _sendMessage("消息已被阅读");
//  }
}
