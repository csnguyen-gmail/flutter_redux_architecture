import 'dart:ui';

import 'package:cls_mobile/models/models.dart';

typedef OnFinishAPI = void Function(String error);

class SetupRequest {
  final OnFinishAPI onFinishAPI;
  SetupRequest(this.onFinishAPI);
}
class SetupSuccess {
  final List<NameCard> cards;
  final Setting setting;
  SetupSuccess(this.cards, this.setting);
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