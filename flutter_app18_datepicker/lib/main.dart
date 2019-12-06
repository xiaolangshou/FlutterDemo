import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DateTimeDemo(),
    );
  }
}

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime selectedDate = DateTime.now();

  _selectDate() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (date == null) {
      return;
    }

    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: _selectDate,
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMMMMd().format(selectedDate)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
