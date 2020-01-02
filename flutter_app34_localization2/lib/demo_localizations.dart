import 'package:intl/intl.dart';
import 'demo_messages_all.dart';
import 'package:flutter/material.dart';

class DemoLocalizations {

  static DemoLocalizations of (BuildContext context) {
    return Localizations.of<DemoLocalizations>(
        context,
        DemoLocalizations
    );
  }

  static Future<DemoLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return DemoLocalizations();
    });
  }

  String get title => Intl.message(
    'hello',
    name: 'title',
    desc: 'demo localizations.',
  );

  String greet(String name) => Intl.message(
    'hello $name',
    name: 'greet',
    desc: 'greet someone.',
    args: [name],
  );

}

class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations>
{
  DemoLocalizationsDelegate();

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // TODO: implement load
    return DemoLocalizations.load(locale);
  }

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }
}