import 'dart:async';
import 'dart:convert';

import 'dart:io';

import 'package:cls_mobile/services/entities/entities.dart';
import 'package:path_provider/path_provider.dart';

class FileStorage {
  final String settingFileName = "setting";

  const FileStorage();

  Future<SettingEntity> loadSetting() async {
    try {
      final file = await _getLocalFile(settingFileName);
      final string = await file.readAsString();
      final json = new JsonDecoder().convert(string);
      return new SettingEntity.fromJson(json);
    }catch(e){
      return new SettingEntity.defaultValue();
    }
  }

  Future<File> saveSetting(SettingEntity entity) async {
    final file = await _getLocalFile(settingFileName);
    return file.writeAsString(new JsonEncoder().convert(entity.toJson()));
  }

  Future<File> _getLocalFile(String name) async {
    final dir = await getApplicationDocumentsDirectory();
    return new File('${dir.path}/$name.json');
  }

  Future<FileSystemEntity> clean(String name) async {
    final file = await _getLocalFile(name);
    return file.delete();
  }
}
