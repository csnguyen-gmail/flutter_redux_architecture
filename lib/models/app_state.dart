
import 'package:cls_mobile/models/models.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<NameCard> cardList;
  final Setting setting;

  AppState({
    this.cardList = const[],
    this.setting = const Setting(),
  });

  AppState copyWith({
    List<NameCard> cards,
    Setting setting,
  }) {
    return new AppState(
      cardList: cards ?? this.cardList,
      setting: setting ?? this.setting,
    );
  }

  @override
  int get hashCode =>
      cardList.hashCode ^
      setting.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              cardList == other.cardList &&
              setting == other.setting;
}
