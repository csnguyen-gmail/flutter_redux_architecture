import 'package:cls_mobile/services/entities/setting_entity.dart';
import 'package:meta/meta.dart';

@immutable
class Setting {
  final bool isNeedPassCode;
  const Setting({this.isNeedPassCode = false});


  static Setting fromEntity(SettingEntity entity) {
    return new Setting(
        isNeedPassCode: entity.isNeedPassCode
    );
  }

  @override
  int get hashCode => isNeedPassCode.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Setting &&
              runtimeType == other.runtimeType &&
              isNeedPassCode == other.isNeedPassCode;
}