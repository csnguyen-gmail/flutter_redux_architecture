
import 'dart:async';
import 'dart:ui';

import 'package:cls_mobile/services/entities/entities.dart';


abstract class WebServiceProtocol {
  Future<List<CardEntity>> loadCards();
  Future<List<CardEntity>> addCard(List<Image> images);
}

