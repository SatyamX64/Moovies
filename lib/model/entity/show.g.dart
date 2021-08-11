// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Show _$ShowFromJson(Map<String, dynamic> json) {
  return Show(
    json['id'] as String,
    json['name'] as String,
    json['thumb'] as String,
    json['banner'] as String,
    json['rate'] as int,
  );
}

Map<String, dynamic> _$ShowToJson(Show instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumb': instance.thumb,
      'banner': instance.banner,
      'rate': instance.rate,
    };
