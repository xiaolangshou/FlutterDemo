import 'package:flutter/material.dart';
import 'model/post.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class Home extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print(index);
        switch (index) {
          case 0:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ListPage(title: 'ListView'),
            ));
            break;
          case 1:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => GridPage(title: 'GridView'),
            ));
            break;
          case 2:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ColumPage(title: 'ColumView'),
            ));
            break;
          case 3:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => RowPage(title: 'RowView'),
            ));
            break;
        }
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        height: 60,
        child: Column(
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              posts[index].title,
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Wheel Demo'),
        elevation: 10.0, // 阴影高度
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  final String title;

  ListPage({this.title});

  int count = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: count,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                //滑动动画
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  //渐隐渐现动画
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

class GridPage extends StatelessWidget {
  final String title;

  GridPage({this.title});

  int count = 27;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: AnimationLimiter(
        child: GridView.builder(
          itemCount: count,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: 3,
              //纵轴间距
              mainAxisSpacing: 10.0,
              //横轴间距
              crossAxisSpacing: 10.0,
              //子组件宽高长度比例
              childAspectRatio: 1.0),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              columnCount: count,
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Container(
                    color: Theme.of(context).primaryColor,
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

class ColumPage extends StatelessWidget {
  final String title;

  ColumPage({this.title});

  int count = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column"),
      ),
      body: AnimationLimiter(
        child: Column(
            children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                children: ChildrenList())),
      ),
    );
  }

  List<Widget> ChildrenList() {
    List<Widget> childs = [];
    for (var i = 0; i < count; i++) {
      childs.add(Container(
        margin: EdgeInsets.all(5),
        color: Colors.grey,
        height: 60,
      ));
    }
    return childs;
  }
}

class RowPage extends StatelessWidget {
  final String title;

  RowPage({this.title});

  int count = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row"),
      ),
      body: AnimationLimiter(
        child: Container(
          height: 60,
          child: Row(
              children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                  children: childrenList())),
        ),
      ),
    );
  }

  List<Widget> childrenList() {
    List<Widget> childs = [];
    for (var i = 0; i < count; i++) {
      childs.add(Container(
        margin: EdgeInsets.only(right: 5),
        color: Colors.yellow,
        width: 60,
      ));
    }
    return childs;
  }
}
