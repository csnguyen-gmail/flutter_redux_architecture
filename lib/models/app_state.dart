
import 'package:cls_mobile/models/models.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<NameCard> cardList;

  AppState({
    this.cardList = const[],
  });

  AppState copyWith({
    List<NameCard> cards,
  }) {
    return new AppState(
      cardList: cards ?? this.cardList,
    );
  }

  @override
  int get hashCode => cardList.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              cardList == other.cardList;
}
