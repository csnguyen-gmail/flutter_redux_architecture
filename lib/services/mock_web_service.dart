import 'dart:async';

import 'dart:ui';

import 'package:cls_mobile/services/entities/card_entity.dart';
import 'package:cls_mobile/services/web_service.dart';

class MockWebService implements WebServiceProtocol {
  int count = 0;
  @override
  Future<List<CardEntity>> addCard(List<Image> images) async{
    if (++count == 3) {
      count = 0;
      throw Exception("Testing error");
    }
    final duration = new Duration(seconds: 2);
    final data = {
      "list": [
        {"name": "New One", "company": "New Company"}
      ]
    };
    final result = await new Future.delayed(duration, () => data);

    return result["list"].map((data) => new CardEntity.fromJson(data)).toList();
  }

  @override
  Future<List<CardEntity>> loadCards() async{
    final duration = new Duration(seconds: 2);
    final data = {
      "list": new List.generate(5, (i) => {"name": "Name$i", "company": "Company$i"})
    };
    final result = await new Future.delayed(duration, () => data);
    // parse from result
    return result["list"].map((data) => new CardEntity.fromJson(data)).toList();
  }
}