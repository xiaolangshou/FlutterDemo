import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatefulWidget {
  @override
  _RxDartDemoState createState() => _RxDartDemoState();
}

class _RxDartDemoState extends State<RxDartDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();

    // _textFieldSubject = PublishSubject<String>();
    // _textFieldSubject.listen((data) => print(data));

    // behaviorSubDemo();
    // publishSubDemo();
    replaySubDemo();
  }

  void behaviorSubDemo() {

    // captures the latest item that has been added to the controller, and emits that as the first item to any new listener.
    BehaviorSubject<String> _subject = BehaviorSubject<String>();

    _subject.add('hello');
    _subject.add('hola');
    _subject.add('aaa');
    _subject.listen((data) => print('listen 1: $data'));
    _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));
    _subject.close();
  }

  void publishSubDemo() {

    PublishSubject<String> _subject = PublishSubject<String>();

    _subject.listen((data) => print('listen 1: $data'));
    _subject.add('hello');

    _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));
    _subject.add('hola');
    _subject.close();
  }

  void replaySubDemo() {
    // captures all of the items that have been added to the controller, and emits those as the first items to any new listener.
    ReplaySubject<String> _subject2 = ReplaySubject<String>();

    _subject2.add('hello');
    _subject2.add('hola');
    _subject2.listen((data) => print('listen 1: $data'));
    _subject2.listen((data) => print('listen 2: ${data.toUpperCase()}'));
    _subject2.close();
  }

  void observableDemo() {
    Observable<String> _observable =
    Observable(Stream.fromIterable(['hello', '你好']));
    Observable.fromFuture(Future.value('hello ~'));
    Observable.fromIterable(['hello', '你好', 'aaa']);
    Observable.just('hello ~');
    Observable.periodic(Duration(seconds: 1), (x) => x.toString());

    _observable.listen(print);
  }

//  @override
//  void dispose() {
//    super.dispose();
//    _textFieldSubject.close();
//  }

  @override
  Widget build(BuildContext context) {
    return Container();
    /*
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );*/
  }
}
