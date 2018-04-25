import 'dart:async';

import 'package:cls_mobile/business/actions.dart';
import 'package:cls_mobile/models/models.dart';
import 'package:cls_mobile/services/entities/entities.dart';
import 'package:cls_mobile/services/file_storage.dart';
import 'package:cls_mobile/services/web_service.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddleware(FileStorage fileStorage, WebServiceProtocol webService, ) {
  return [
    new TypedMiddleware<AppState, SetupRequest>(_setupAction(fileStorage, webService)),
    new TypedMiddleware<AppState, AddCardRequest>(_addCardAction(webService)),
  ];
}

Middleware<AppState> _setupAction(FileStorage fileStorage, WebServiceProtocol webService) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    var setupRequest = action as SetupRequest;

    // call multi functions return Future at the same time
    Future.wait([fileStorage.loadSetting(), webService.loadCards()]).then((results) {
      // transform entity to object
      final setting = Setting.fromEntity(results[0] as SettingEntity);
      final cards = (results[1] as List<CardEntity>).map((entity)=>NameCard.fromEntity(entity)).toList();

      store.dispatch(new SetupSuccess(cards, setting)); // to update App state
      setupRequest.onFinishAPI("");                     // to update UI state
    }).catchError((error) {
      setupRequest.onFinishAPI(error.toString());       // to update UI state
    });
  };
}

Middleware<AppState> _addCardAction(WebServiceProtocol webService) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    var addCardRequest = action as AddCardRequest;

    webService.addCard(addCardRequest.images).then((cardEntities) {
      final cards = cardEntities.map((entity)=>NameCard.fromEntity(entity)).toList();

      store.dispatch(new AddCardSuccess(cards));        // to update App State
      addCardRequest.onFinishAPI("");                   // to update UI state
    }).catchError((error) {
      addCardRequest.onFinishAPI(error.toString());     // to update UI state
    });
  };
}
