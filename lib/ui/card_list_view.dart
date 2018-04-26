
import 'package:cls_mobile/business/selectors.dart';
import 'package:cls_mobile/models/models.dart';
import 'package:cls_mobile/ui/card_search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:memoize/memoize.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';


class CardListView extends StatefulWidget {
  @override
  _CardListViewState createState() => new _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  Function searchCardByKeywordCache = imemo2(searchCardByKeyword);
  String keywordSearch = "";

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true, // don't update if data not change even AppState change
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return new Column(
          children: <Widget>[
            new CardSearchTextField(onFinishInput: onFinishInput,),
            new Expanded(child: buildListView(context, vm)),
          ],
        );
      },
    );
  }

  Widget buildListView(BuildContext context, _ViewModel vm) {
    List<NameCard> displayCardList = searchCardByKeywordCache(vm.cards, keywordSearch);
    return ListView.builder(
      padding: EdgeInsets.all(15.0),
      itemCount: displayCardList.length,
      itemBuilder: (BuildContext context, int index) {
        final card = displayCardList[index];
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(card.name),
              subtitle: Text(card.company),
            ),
            Divider(),
          ],
        );
      },
    );
  }

  void onFinishInput(String string) {
    if (string != keywordSearch) {
      setState(() {
        keywordSearch = string;
      });
    }
  }

  // for DEMO using StreamSubscription<AppState>
//  StreamSubscription<AppState> appStateSubscription; // Listen on AppState
//
//  @override
//  void initState() {
//    appStateSubscription = store.onChange.listen((state) {
//      // TODO: play with store
//    });
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    appStateSubscription.cancel();
//    super.dispose();
//  }
}

class _ViewModel {
  final List<NameCard> cards;

  _ViewModel({
    @required this.cards,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    final cards = store.state.cardList;
    return new _ViewModel(
      cards: cards,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is _ViewModel && runtimeType == other.runtimeType && cards == other.cards;

  @override
  int get hashCode => cards.hashCode;
}
