import 'package:cls_mobile/services/entities/card_entity.dart';
import 'package:meta/meta.dart';

@immutable
class NameCard {
  final String name;
  final String company;
  NameCard(
    this.name,
    this.company,
  );

  @override
  int get hashCode => name.hashCode ^ company.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is NameCard &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              company == other.company;

  static NameCard fromEntity(CardEntity entity) {
    return new NameCard(
        entity.name,
        entity.company);
  }
}
