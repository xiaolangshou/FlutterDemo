import 'package:flutter/material.dart';
// import 'localizations.dart';
import 'demo_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'i18n_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('en', 'US'),
//      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocale) {
//        return Locale('en', 'US');
//      },
      localizationsDelegates: [
        DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: 'a',
      routes: {
        'a': (context) => I18nDemo()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}