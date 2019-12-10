import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {

  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count += 1;
      print(_count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stateManagementDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Counter(_count, _increaseCount),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increaseCount,
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;

  Counter(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
      ),
    );
  }
}

//class StateManagementDemo extends StatelessWidget {
//
//  int count = 2;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('stateManagementDemo'),
//        elevation: 0.0,
//      ),
//      body: Center(
//        child: Chip(label: Text('$count')),
//      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: () {
//          count += 1;
//          print(count);
//        },
//      ),
//    );
//  }
//}
