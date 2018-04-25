import 'package:json_annotation/json_annotation.dart';
part 'card_entity.g.dart';

@JsonSerializable()
class CardEntity extends Object with _$CardEntitySerializerMixin {
  final String name;
  final String company;
  CardEntity(
    this.name,
    this.company,
  );

  factory CardEntity.fromJson(Map<String, dynamic> json) => _$CardEntityFromJson(json);
}