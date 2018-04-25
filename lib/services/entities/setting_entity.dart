import 'package:json_annotation/json_annotation.dart';
part 'setting_entity.g.dart';

@JsonSerializable()
class SettingEntity extends Object with _$SettingEntitySerializerMixin {
  final bool isNeedPassCode;
  SettingEntity(this.isNeedPassCode);
  factory SettingEntity.defaultValue() => new SettingEntity(false);

  factory SettingEntity.fromJson(Map<String, dynamic> json) => _$SettingEntityFromJson(json);
}
