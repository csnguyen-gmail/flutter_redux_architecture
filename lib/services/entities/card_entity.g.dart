// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

CardEntity _$CardEntityFromJson(Map<String, dynamic> json) =>
    new CardEntity(json['name'] as String, json['company'] as String);

abstract class _$CardEntitySerializerMixin {
  String get name;
  String get company;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'name': name, 'company': company};
}
