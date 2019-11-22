import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/list_model.dart';

class Profile1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(listModels[0].title + '的个人主页'),
      ),
      body: null,
    );
  }
}