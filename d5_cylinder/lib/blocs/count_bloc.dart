import 'dart:async';
import 'package:flutter/material.dart';

abstract class BlocBase{
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget{

  final T bloc;
  final Widget child;

  int _count = 0;
  final _countActionController = StreamController<int>();
  StreamSink<int> get counter => _countActionController.sink;

  final _countController = StreamController<int>();
  Stream<int> get count => _countController.stream;


  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  @override
  _BlocProviderState<T> createState() => new _BlocProviderState<T>();

  static Type _typeOf<T>() => T;

  static T of<T extends BlocBase>(BuildContext context){
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>>{
  @override
  void dispose(){
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}



class AVBlocData implements BlocBase {
  int _count;

  StreamController<int> _countController = new StreamController();
  StreamSink<int> get _inadd => _countController.sink;
  Stream<int> get outCount => _countController.stream;

  StreamController _actionController = new StreamController();
  StreamSink get updateCount => _actionController.sink;

  AVBlocData(){
    _count = 0;
    _actionController.stream.listen(_handleLogic);
  }

  void _handleLogic(data){
    _count = data + 1;
    _inadd.add(_count);
  }

  void dispose(){
    _countController.close();
    _actionController.close();
  }
}

//class CountBloc {
//
//  int _count = 0;
//  final _countActionController = StreamController<int>();
//  StreamSink<int> get counter => _countActionController.sink;
//
//  final _countController = StreamController<int>();
//  Stream<int> get count => _countController.stream;
//
//  CountBloc() {
//    _countActionController.stream.listen(onData);
//    _countController.stream.listen(onData);
//
//  }
//
//  void onData(int data) {
//    print("data:$data");
//    _count = (data + _count);
//    _countController.add(_count);
//
//  }
//
//  void dispose() {
//
//    _countActionController.close();
//    _countController.close();
//  }
//
//  void log(){
//
//    print("Bloc...");
//  }
//}



//class CounterProvider extends InheritedWidget {
//  final CountBloc bloc;
//  final Widget child;
//
//  const CounterProvider({
//    Key key,
//    this.bloc,
//    this.child,
//  })  :
////        assert(child != null),
//        super(
//          key: key,
//          child: child,
//        );
//
//  static CounterProvider of(BuildContext context) {
//    return context.inheritFromWidgetOfExactType(CounterProvider)
//        as CounterProvider;
//  }
//
//  @override
//  bool updateShouldNotify(CounterProvider old) {
//    return true;
//  }
//
//
//}


