import 'dart:ui';

import 'package:cls_mobile/models/models.dart';

typedef OnFinishAPI = void Function(String error);

class CardListRequest {
  final OnFinishAPI onFinishAPI;
  CardListRequest(this.onFinishAPI);
}
class CardListSuccess {
  final List<NameCard> cards;
  CardListSuccess(this.cards);
}

class AddCardRequest {
  final List<Image> images;
  final OnFinishAPI onFinishAPI;
  AddCardRequest(this.images, this.onFinishAPI);
}

class AddCardSuccess {
  final List<NameCard> cards;
  AddCardSuccess(this.cards);
}