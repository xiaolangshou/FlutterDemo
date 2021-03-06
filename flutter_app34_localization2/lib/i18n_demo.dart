import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_app34_localization2/localizations.dart';
import 'demo_localizations.dart';

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
            Text(
              // Localizations.of(context, DemoLocalizations).title,
              DemoLocalizations.of(context).greet('thomas lau lalalalalalalala'),
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              // Localizations.of(context, DemoLocalizations).title,
              DemoLocalizations.of(context).greet2('thomas lau lalalalalalalala'),
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
