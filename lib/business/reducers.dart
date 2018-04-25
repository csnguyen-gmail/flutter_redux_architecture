import 'package:cls_mobile/business/actions.dart';
import 'package:cls_mobile/models/models.dart';
import 'package:redux/redux.dart';

final Reducer<AppState> appReducer = combineReducers([
  new TypedReducer<AppState, SetupSuccess>(_setupSuccessReducer),
  new TypedReducer<AppState, AddCardSuccess>(_addCardSuccessReducer),
]);

AppState _setupSuccessReducer(AppState state, SetupSuccess action) {
  return state.copyWith(
      cards: action.cards,
      setting: action.setting
  );
}

AppState _addCardSuccessReducer(AppState state, AddCardSuccess action) {
  return state.copyWith(
      cards: new List.from(state.cardList)..insertAll(0, action.cards)
  );
}
