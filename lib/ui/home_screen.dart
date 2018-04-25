import 'package:cls_mobile/localization/localization.dart';
import 'package:cls_mobile/models/models.dart';
import 'package:cls_mobile/ui/card_list_view.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cls_mobile/business/actions.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
        rebuildOnChange: false, // don't need to rebuild, just lookup onChange on State
        builder: (context, store) {
          return Scaffold(
            appBar: AppBar(
              title: Text(ClsLocalizations.of(context).cardTitle),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    if (!isLoading) {
                      setState(() {
                        isLoading = true;
                      });
                      store.dispatch(SetupRequest(onFinishApi));
                    }
                  },
                  icon: Icon(Icons.refresh),
                )
              ],
            ),
            body: new Stack(
              children: <Widget>[
                CardListView(),
                Container(  // Spinner
                  alignment: AlignmentDirectional.center,
                  color: isLoading ? Colors.black26 : null,
                  child: isLoading ? CircularProgressIndicator() : null,
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: new Icon(Icons.add),
              onPressed: () {
                if (!isLoading) {
                  setState(() {
                    isLoading = true;
                  });
                  store.dispatch(new AddCardRequest([], onFinishApi)); // TODO: add [Image]
                }
              },
            ),
          );
        });
  }

  void onFinishApi(String error) {
    setState(() {
      isLoading = false;
    });
    if (error != "") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(error),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          });
    }
  }
}
