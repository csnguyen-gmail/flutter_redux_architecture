import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// This file was generated in two steps, using the Dart intl tools. With the
// app's root directory (the one that contains pubspec.yaml) as the current
// directory:
//
// flutter pub get
// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/localization/l10n lib/localization/localization.dart
// flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/localization/l10n --no-use-deferred-loading lib/localization/localization.dart lib/localization/l10n/intl_*.arb
//
// The second command generates intl_messages.arb and the third generates
// messages_all.dart. There's more about this process in
// https://pub.dartlang.org/packages/intl.
import 'l10n/messages_all.dart';

class ClsLocalizations {
  static Future<ClsLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new ClsLocalizations();
    });
  }

  static ClsLocalizations of(BuildContext context) {
    return Localizations.of<ClsLocalizations>(context, ClsLocalizations);
  }

  String get title {
    return Intl.message(
      'Custumer Ledger System',
      name: 'title',
      desc: 'Title for the CLS application',
    );
  }
  String get cardTitle {
    return Intl.message(
      'Cards',
      name: 'cardTitle',
      desc: 'Card list',
    );
  }
  String get searchTextHint {
    return Intl.message(
      'Input to search',
      name: 'searchTextHint',
      desc: 'Search Text hint',
    );
  }
}

class ClsLocalizationsDelegate extends LocalizationsDelegate<ClsLocalizations> {
  const ClsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<ClsLocalizations> load(Locale locale) => ClsLocalizations.load(locale);

  @override
  bool shouldReload(ClsLocalizationsDelegate old) => false;
}
