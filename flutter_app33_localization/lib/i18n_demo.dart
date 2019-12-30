import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18n'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locale.toString()),
          ],
        ),
      ),
    );
  }
}
