import 'package:flutter/material.dart';
import 'i18n_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'material_component.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 方法一
      // locale: Locale('en', 'US'),
      // 方法二
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocale) {
        return Locale('zh', 'CN');
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: 'mtc',
      routes: {
        'i18n': (context) => I18nDemo(),
        'mtc': (context) => DateTimeDemo(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}



