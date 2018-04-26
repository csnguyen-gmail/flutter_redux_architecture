import 'package:cls_mobile/business/actions.dart';
import 'package:cls_mobile/models/models.dart';
import 'package:redux/redux.dart';

final Reducer<AppState> appReducer = combineReducers([
  new TypedReducer<AppState, CardListSuccess>(_setupSuccessReducer),
  new TypedReducer<AppState, AddCardSuccess>(_addCardSuccessReducer),
]);

AppState _setupSuccessReducer(AppState state, CardListSuccess action) {
  return state.copyWith(
      cards: action.cards,
  );
}

AppState _addCardSuccessReducer(AppState state, AddCardSuccess action) {
  return state.copyWith(
      cards: new List.from(state.cardList)..insertAll(0, action.cards)
  );
}
