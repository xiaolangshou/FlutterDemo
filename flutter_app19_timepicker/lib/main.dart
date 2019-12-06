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
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);

  // 异步
  Future<void> _selectDate() async {
    final DateTime date = await showDatePicker(context: null,
        initialDate: null,
        firstDate: null,
        lastDate: null);

    if (date == null) return;

    setState(() {
      selectedDate = date;
    });
  }

  // 异步
  Future<void> _selectedTime() async {
    final TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: selectedTime);
    if (time == null) return;

    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('date time demo'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.green,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: _selectedTime,
              child: Row(
                children: <Widget>[
                  Text(selectedTime.format(context)),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
