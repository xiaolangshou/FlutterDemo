import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WelcometoFlutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('WelcometoFlutter1'),
        ),
        body: new Center(
          child: new Text('Hello World 1'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int count=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: AnimationLimiter(
        child:ListView.builder(
          itemCount: count,
          itemBuilder: (context,index){
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation( //滑动动画
                verticalOffset: 50.0,
                child: FadeInAnimation( //渐隐渐现动画
                  child: Container(
                    margin: EdgeInsets.all(5),
                    color: Theme.of(context).primaryColor,
                    height: 60,
                  ),
                ),
              ),
            );
          },
        ),
      ),

    );
  }
}
