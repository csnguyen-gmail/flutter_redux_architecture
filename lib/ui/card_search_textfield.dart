
import 'package:cls_mobile/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

typedef OnFinishInput = void Function(String input);

class CardSearchTextField extends StatefulWidget {
  final OnFinishInput onFinishInput;

  CardSearchTextField({
    Key key,
    @required this.onFinishInput,
  }) : super(key: key);

  @override
  _CardSearchTextFieldState createState() => new _CardSearchTextFieldState();
}

class _CardSearchTextFieldState extends State<CardSearchTextField> {
  final subject = new PublishSubject<String>();

  @override
  void initState() {
    super.initState();
    subject.stream.debounce(new Duration(milliseconds: 600)).listen((string){
      widget.onFinishInput(string);
    });
  }

  @override
  void dispose() {
    subject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: ClsLocalizations.of(context).searchTextHint,
        icon: new Icon(Icons.search),
      ),
      onChanged:(string) => (subject.add(string)),
    );
  }
}

