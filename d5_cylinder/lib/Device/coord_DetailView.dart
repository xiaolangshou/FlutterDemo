import 'dart:convert';
import 'package:d5_cylinder/blocs/count_bloc.dart';
import 'package:d5_cylinder/common/LogHelper.dart';
import 'package:d5_cylinder/models/coord_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:log4d/log4d.dart';

class CoordDetailView extends StatelessWidget {
  String _text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyanAccent,
    padding: EdgeInsets.all(150),
      child: new FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

        },
      ),
    );
  }
}
