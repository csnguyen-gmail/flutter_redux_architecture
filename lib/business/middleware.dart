import 'package:cls_mobile/business/actions.dart';
import 'package:cls_mobile/models/models.dart';
import 'package:cls_mobile/services/web_service.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddleware(WebServiceProtocol webService, ) {
  return [
    new TypedMiddleware<AppState, CardListRequest>(_setupAction(webService)),
    new TypedMiddleware<AppState, AddCardRequest>(_addCardAction(webService)),
  ];
}

Middleware<AppState> _setupAction(WebServiceProtocol webService) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    var setupRequest = action as CardListRequest;

    webService.loadCards().then((results) {
      // transform entity to object
      final cards = results.map((entity)=>NameCard.fromEntity(entity)).toList();

      store.dispatch(new CardListSuccess(cards)); // to update App state
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
