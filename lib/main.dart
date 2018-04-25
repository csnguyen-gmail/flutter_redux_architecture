
import 'package:cls_mobile/business/middleware.dart';
import 'package:cls_mobile/business/reducers.dart';
import 'package:cls_mobile/localization/localization.dart';
import 'package:cls_mobile/models/models.dart';
import 'package:cls_mobile/services/file_storage.dart';
import 'package:cls_mobile/services/mock_web_service.dart';
import 'package:cls_mobile/themes/theme.dart';
import 'package:cls_mobile/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(new ClsApp());
}

class ClsApp extends StatelessWidget {
  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState(),
    middleware: createMiddleware(new FileStorage(), new MockWebService()),
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        localizationsDelegates: [
          const ClsLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''), // English
          const Locale('ja', ''), // Japanese
        ],
        theme: ClsTheme.theme,
        onGenerateTitle: (BuildContext context) => ClsLocalizations.of(context).title,
        routes: {
          "/": (context) {
            return HomeScreen();
          }
        },
      ),
    );
  }
}

// RefreshIndicator

